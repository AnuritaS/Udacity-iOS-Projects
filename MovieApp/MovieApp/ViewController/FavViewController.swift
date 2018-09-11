//
//  FavViewController.swift
//  MovieApp
//
//  Created by Anurita Srivastava on 01/09/18.
//  Copyright © 2018 Anurita Srivastava. All rights reserved.
//

import UIKit
import  CoreData

class FavViewController: UIViewController{
    var dataControl: DataController!
    var sharedInstance = ApiCall()
    var dataSource: DataSource<Movie,movieCell>!
  
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //search.delegate = self
      //  sharedInstance.saveData()
        
        
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
    
    func setupFC(){
        let request : NSFetchRequest<Movie> = Movie.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        let predicate = NSPredicate(format: "fav == %@", NSNumber(value: true))
        request.predicate = predicate
        dataSource = DataSource(tableView: tableView, managedObjectContext: dataControl.viewContext, fetchRequest: request, configure: {(moviecell, movie) in
            // print(movie.title!)
            moviecell.title.text = movie.title
            moviecell.date.text = movie.date
            moviecell.rating.text = "\(movie.rating)"
        })
        tableView.dataSource = dataSource
        // tableView.reloadData()
        
    }
    
}
