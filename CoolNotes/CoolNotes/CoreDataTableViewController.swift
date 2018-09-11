//
//  CoreDataTableViewController.swift
//  CoolNotes
//
//  Created by Anurita Srivastava on 14/03/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit
import CoreData

class CoreDataTableViewController: UITableViewController {

    var fetchedResultController :   NSFetchedResultsController<NSFetchRequestResult>? {
    didSet {
        fetchedResultController?.delegate = self
        executeSearch()
        tableView.reloadData()
    }
    }
    init(fetchedResultController fc: NSFetchedResultsController<NSFetchRequestResult>, style: UITableViewStyle = .plain){
        fetchedResultController = fc
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CoreDataTableViewController{
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("Implemented by a subclass")
    }
}


