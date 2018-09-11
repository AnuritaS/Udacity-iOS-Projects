//
//  StudentViewController.swift
//  LibraryManagementSystem
//
//  Created by Anurita Srivastava on 11/09/18.
//  Copyright © 2018 Anurita Srivastava. All rights reserved.
//

import UIKit
import CoreData

class StudentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataControl: DataController!
    var dataSource: ListDataSource<Student,studentCell>!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
        dataSource = nil
    }
    override func viewWillAppear(_ animated: Bool) {
        self.setupFC()
    }
    
    func setupFC(predicate: NSPredicate? = nil){
        let request: NSFetchRequest<Student> = Student.fetchRequest()
        let sortDesc = NSSortDescriptor(key: "regID", ascending: true)
        request.sortDescriptors = [sortDesc]
        request.predicate = predicate
        dataSource = ListDataSource(tableView: tableView, managedObjectContext: dataControl.viewContext, fetchRequest: request, configure: {(studentCell, student) in
            studentCell.regId.text = student.regID
//            if student.issued != nil{
//            
//                studentCell.books.text = student.issued.
//            }
        })
        print("yes",dataSource.fRC.sections?[0].numberOfObjects)
        tableView.dataSource = dataSource
    }
    
  

}
