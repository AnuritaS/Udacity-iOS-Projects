//
//  DataSource.swift
//  MovieApp
//
//  Created by Anurita Srivastava on 01/09/18.
//  Copyright © 2018 Anurita Srivastava. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataSource<ObjectType: NSManagedObject, CellType: UITableViewCell>: NSObject, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    var fRC:NSFetchedResultsController<ObjectType>!
    
    var configureFunction: (CellType, ObjectType) -> Void
    
    var tableView:UITableView!
    var managedObjectContext: NSManagedObjectContext!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return fRC.sections?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fRC.sections?[section].numberOfObjects ?? 0
    }
    
   
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete: delete(at: indexPath)
        default: () // Unsupported
        }
    }
    
    func delete(at indexPath: IndexPath){
        let objToDelete = fRC.object(at: indexPath)
        managedObjectContext.delete(objToDelete)
        try? managedObjectContext.save()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let object = fRC.object(at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CellType.self)", for: indexPath) as! CellType
        
        configureFunction(cell, object)
        
        return cell
    }
    

    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type{
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .fade)
        case .move:
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        default:
            break
        }
    }


    init(tableView: UITableView, managedObjectContext: NSManagedObjectContext, fetchRequest: NSFetchRequest<ObjectType>, configure: @escaping (CellType, ObjectType) -> Void) {
       
        self.tableView = tableView
        self.managedObjectContext = managedObjectContext
        self.configureFunction = configure
        self.fRC = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
      
        super.init()
        
        fRC.delegate = self
        
        do {
            try fRC.performFetch()
        } catch {
            fatalError("the shit just hitted the fan: \(error.localizedDescription)")
        }
        
}
}
