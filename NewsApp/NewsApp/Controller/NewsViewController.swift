//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Anurita Srivastava on 11/09/18.
//  Copyright © 2018 Anurita Srivastava. All rights reserved.
//

import UIKit
import CoreData

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataControl: DataController!
    var dataSource: DataSource<News,newsCell>!
    var sharedInstance = TopNewsAPICall()
    var saveDataInstance = setUpCoreData()
    
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        saveDataInstance.dataControl = dataControl
        setupSearch()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.setupFC()
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: false)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        dataSource = nil
    }
        
    func setupSearch(){

        // Setup the Search Controllersr
       searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Keyword"
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        } else {
            // Fallback on earlier versions
        }
        definesPresentationContext = true
    }
        
    func setupFC(){
        let request: NSFetchRequest<News> = News.fetchRequest()
        let sortDesc = NSSortDescriptor(key: "publishedAt", ascending: true)
        request.sortDescriptors = [sortDesc]
        
        dataSource = DataSource(tableView: tableView, managedObjectContext: dataControl.viewContext, fetchRequest: request, configure: {(newsCell, news) in
            newsCell.title.text = news.title
            newsCell.source.text = news.author
            
            guard let date = news.publishedAt?.dateFromISO8601 else{
                return
            }
            newsCell.date.text = "\(date)"
            
        })
        
        tableView.dataSource = dataSource
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If this is a NotesListViewController, we'll configure its `Notebook`
        if let vc = segue.destination as? NewsDetailsViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                vc.news = dataSource.fRC.object(at: indexPath)
                vc.dataControl = dataControl
                
            }
        }
    }
}

extension NewsViewController{
    
    func getNews(searchText: String){
        sharedInstance.getTopNews(searchText: searchText, completion: { (result) in
            switch result {
            case .Success(let data):
                self.saveDataInstance.clearData()
                self.saveDataInstance.createnewsEntityFrom(array: data, completion: {value in
                    if value{
                        self.setupFC()
                    }else{
                        print("error")
                    }
                })
                
            case .Error(let message):
                print(message)
            }
        })
    }
    
    }

extension NewsViewController: UISearchBarDelegate{

    func searchBarIsEmpty() -> Bool {
    // Returns true if the text is empty or nil
    return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if !searchBarIsEmpty(){
            
            getNews(searchText: searchBar.text ?? "")
        }
        tableView.reloadData()
    }

    }



