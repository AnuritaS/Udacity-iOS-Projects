//
//  NotebookViewController.swift
//  CoolNotes
//
//  Created by Anurita Srivastava on 14/03/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit
import CoreData

class NotebookViewController: CoreDataTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let delegate = UIApplication.shared.delegate as! AppDelegate
        let stack = delegate.stack
        
        let fr = NSFetchedRequest<NSFetchRequestResult>(entityName: "Notebook")
        fr.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true), NSSortDescriptor(key: "creationDate", ascending: false)]
        
        fetchedResultController = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: stack.context, sectionNameKeyPath: nil, cacheName: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nb = fetchedResultController?.object(at: indexPath) as! Notebook
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = nb.name
        cell.detailTextLabel?.text = "\(nb.note!.count) notes"
        
        return cell
        
    }

}
