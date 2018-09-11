//
//  movieDetailViewController.swift
//  MovieApp
//
//  Created by Anurita Srivastava on 08/09/18.
//  Copyright © 2018 Anurita Srivastava. All rights reserved.
//

import UIKit
import  CoreData

class movieDetailViewController: UIViewController {
    
    var dataControl: DataController!
    
    @IBOutlet weak var favB: UIButton!
    @IBOutlet weak var dataTview: UITextView!
    var movie: Movie!
    
    //var search = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupFC()
        // Do any additional setup after loading the view, typically from a nib.
        //search.delegate = self
    
        //        search.obscuresBackgroundDuringPresentation = false
        //        search.searchBar.text = "Search movies"
        //        definesPresentationContext = true
        
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("fav",movie.fav)
    }
    
    @IBAction func saveData(_ sender: Any) {
      
        if !movie.fav{
            
            movie.fav = true
        }else{
            movie.fav = false
        }
        DispatchQueue.main.async(execute: {
             self.setupFC()
        })
    
            try? dataControl.viewContext.save()
    }
    
    func setupFC(){
    dataTview.text = movie.title!
        if movie.fav{
            self.favB.backgroundColor = .red
           
        }else{
            self.favB.backgroundColor = .clear
        }
    }
}
