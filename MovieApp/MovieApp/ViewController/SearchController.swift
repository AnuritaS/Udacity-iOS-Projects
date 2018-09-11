//
//  SearchController.swift
//  MovieApp
//
//  Created by Anurita Srivastava on 31/08/18.
//  Copyright © 2018 Anurita Srivastava. All rights reserved.
//

import UIKit
import  CoreData

class SearchController: UIViewController {

    var dataControl: DataController!
    var sharedInstance = ApiCall()
  
    @IBOutlet weak var tableView: UITableView!
     var dataSource: DataSource<Movie,movieCell>!
    
    //var search = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //search.delegate = self
        self.saveData()
//        search.obscuresBackgroundDuringPresentation = false
//        search.searchBar.text = "Search movies"
//        definesPresentationContext = true
     
      
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        dataSource = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            self.setupFC()
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: false)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
        
    
    }
    
    func saveData() {
        let defaults = UserDefaults.standard
        let isPreloaded = defaults.bool(forKey: "isPreloaded")
        
        if !isPreloaded {

        sharedInstance.getMovies(completion: ({ (result) in
            switch result {
            case .Success(let data):
                self.sharedInstance.clearData()
                self.sharedInstance.createMovieEntityFrom(array: data, completion: {value in
                    if value{
                        self.setupFC()
                    }else{
                        print("error")
                    }
                })
            case .Error(let message):
                print(message)
            }
        }))
            defaults.set(true, forKey: "isPreloaded")
        }
    }
    
    func setupFC(){
         var request : NSFetchRequest<Movie> = Movie.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        dataSource = DataSource(tableView: tableView, managedObjectContext: dataControl.viewContext, fetchRequest: request, configure: {(moviecell, movie) in
           // print(movie.title!)
             moviecell.title.text = movie.title
            moviecell.date.text = movie.date
            moviecell.rating.text = "\(movie.rating)"
        })
        tableView.dataSource = dataSource
       // tableView.reloadData()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If this is a NotesListViewController, we'll configure its `Notebook`
        if let vc = segue.destination as? movieDetailViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                vc.movie = dataSource.fRC.object(at: indexPath) as! Movie!
                vc.dataControl = dataControl
                
            }
        }
    }
}
//extension SearchController: UISearchBarDelegate{
//    func searchBarIsEmpty() -> Bool {
//        // Returns true if the text is empty or nil
//        return search.searchBar.text?.isEmpty ?? true
//    }
//
//    //func searc
//
//
//}

