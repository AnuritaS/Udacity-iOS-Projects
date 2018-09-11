//
//  ViewController.swift
//  LibraryMS
//
//  Created by Anurita Srivastava on 26/08/18.
//  Copyright © 2018 Anurita Srivastava. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var dataControl: DataController!
    var fetchRC: NSFetchedResultsController<Books>!
    @IBOutlet weak var tableView: UITableView!
    let search = UISearchController(searchResultsController: nil)

    var titleOfBook = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupFC()
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search Books"
        navigationItem.searchController = search
        definesPresentationContext = true
        
    }
    
    func setupFC(predicate: NSPredicate? = nil){
        let fetch:NSFetchRequest<Books> = Books.fetchRequest()
        let sort = NSSortDescriptor(key: "title", ascending: true)
        fetch.sortDescriptors = [sort]
        fetch.predicate = predicate
        fetchRC = NSFetchedResultsController(fetchRequest: fetch, managedObjectContext: dataControl.viewContext, sectionNameKeyPath: nil, cacheName: nil)
            fetchRC.delegate = self
        do{
                  try fetchRC.performFetch()
           
            } catch {
                print("Failed to retrieve record")
                print(error)
            }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let obj = fetchRC.object(at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! bookCell
        cell.title.text = obj.title
        cell.author.text = obj.author
        if obj.assigned{
        cell.assigned.text = "Assigned"
            cell.assigned.backgroundColor = .green
        }else{
            cell.assigned.text = "Not Assigned"
            cell.assigned.backgroundColor = .red
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return fetchRC.sections?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
          return fetchRC.sections?[0].numberOfObjects ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        performSegue(withIdentifier: "assign", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let vc = segue.destination as? AssignVC {
          if let indexPath = tableView.indexPathForSelectedRow {
        vc.book = fetchRC.object(at: indexPath)
        vc.dataControl = dataControl
        
    }
        }
}
}
extension ViewController: UISearchBarDelegate, UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = search.searchBar.text ?? ""
        filterContentForSearchText(searchText)
        
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return search.searchBar.text?.isEmpty ?? true
    }
    
   func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        if searchBarIsEmpty(){
             setupFC()
        }else{
        let predicate1  = searchText.count > 0 ?
            NSPredicate(format:"title contains[cd] %@", searchText) : nil
        let predicate2  = searchText.count > 0 ?
            NSPredicate(format:"author contains[cd] %@", searchText) : nil
        let compound = NSCompoundPredicate(orPredicateWithSubpredicates: [predicate1!, predicate2!])
        setupFC(predicate: compound)
        }
        tableView.reloadData()
    }
    
}
extension ViewController: NSFetchedResultsControllerDelegate{
func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    tableView.beginUpdates()
}

func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    tableView.endUpdates()
}

func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    switch type{
    case .update:
        tableView.reloadRows(at: [indexPath!], with: .fade)
    default:
        return
    }
}
}

