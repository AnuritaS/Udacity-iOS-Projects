//
//  BooksViewController.swift
//  LibraryManagementSystem
//
//  Created by Anurita Srivastava on 11/09/18.
//  Copyright © 2018 Anurita Srivastava. All rights reserved.
//

import UIKit
import CoreData

class BooksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataControl: DataController!
    var dataSource: ListDataSource<Books,bookCell>!
    var searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupSearchController()
        self.makeTabBar()
    }

    override func viewWillDisappear(_ animated: Bool) {
        dataSource = nil
    }
    override func viewWillAppear(_ animated: Bool) {
        self.setupFC()
    }
    
    func setupSearchController(){
        searchController.searchBar.delegate = self
    
        // Setup the Search Controllersr
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Books"
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        } else {
            // Fallback on earlier versions
        }
        definesPresentationContext = true
    }
    
    func setupFC(predicate: NSPredicate? = nil){
        let request: NSFetchRequest<Books> = Books.fetchRequest()
        let sortDesc = NSSortDescriptor(key: "title", ascending: true)
        request.sortDescriptors = [sortDesc]
        request.predicate = predicate
        dataSource = ListDataSource(tableView: tableView, managedObjectContext: dataControl.viewContext, fetchRequest: request, configure: {(bookCell, book) in
            bookCell.title.text = book.title
            bookCell.author.text = book.author
            if book.assigned{
                bookCell.assigned.backgroundColor = UIColor.green
                bookCell.assigned.text = "Assigned"
            }else{
                bookCell.assigned.backgroundColor = UIColor.red
                bookCell.assigned.text = "Not Assigned"
            }
        })
        
        tableView.dataSource = dataSource
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? BookDetailsViewController{
            if let indexPath = tableView.indexPathForSelectedRow{
                controller.datacontrol = dataControl
                controller.book = dataSource.fRC.object(at: indexPath)
            }
        }
    }
}

extension BooksViewController: UISearchBarDelegate, UISearchResultsUpdating{
    
    
    // MARK: - UISearchBar Delegate

    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
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
   
    func updateSearchResults(for searchController: UISearchController) {
    let searchText = searchController.searchBar.text ?? ""
        filterContentForSearchText(searchText)
    }

}



