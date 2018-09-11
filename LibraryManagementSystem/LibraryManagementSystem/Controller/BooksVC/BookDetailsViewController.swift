//
//  BookDetailsViewController.swift
//  LibraryManagementSystem
//
//  Created by Anurita Srivastava on 11/09/18.
//  Copyright © 2018 Anurita Srivastava. All rights reserved.
//

import UIKit
import CoreData

class BookDetailsViewController: UIViewController {

    var datacontrol: DataController!
    @IBOutlet weak var detailView: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var assignB: UIButton!
 
    var book: Books!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }

    func setupView(){
        
        if book.assigned{
            var text = "\(String(describing: book.title!)) by \(String(describing: book.author!))  is assigned to:"
            if let regID = book.assignedTo?.regID{
            detailView.text =  text+"\(String(describing: regID))"
            }
           textField.isHidden = true
             assignB.setTitle("Return", for: .normal)
        }else{
            detailView.text = "\(String(describing: book.title!)) by \(String(describing: book.author!)) is not assigned."
            textField.isHidden = false
            assignB.setTitle("Issue", for: .normal)
        }
    }


    @IBAction func BookDeliver(_ sender: Any) {
         datacontrol.viewContext.performAndWait {
        if !book.assigned{
                 issueBooks()
           
        }else{
            returnBooks()
        }
        }
        DispatchQueue.main.async {
                      self.setupView()
                  }
    }
    
    @IBAction func dismiss(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
}

extension BookDetailsViewController{
    
    
    func issueBooks(){
     
        let reg = textField.text
        if !(reg?.isEmpty)!{
            let student = Student(context: datacontrol.viewContext)
            student.regID = reg
            book.assignedTo = student
            book.assigned = true
           
        }
        try? datacontrol.viewContext.save()
      
    }
    
    func returnBooks(){
    
book.assignedTo?.regID = nil
            book.assignedTo = nil
            book.assigned = false
        
        try? datacontrol.viewContext.save()
    }
}
