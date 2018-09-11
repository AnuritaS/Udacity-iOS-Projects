//
//  AssignVC.swift
//  LibraryMS
//
//  Created by Anurita Srivastava on 27/08/18.
//  Copyright © 2018 Anurita Srivastava. All rights reserved.
//


import UIKit
import CoreData

class AssignVC: UIViewController, NSFetchedResultsControllerDelegate {
    var dataControl: DataController!
    var fetchRC: NSFetchedResultsController<Student>!
    var book: Books!
    var student: [Student]!
    var studentID: String!
    var assign: Bool!
    
    @IBOutlet var iView: AssignView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       self.callForFC()
      
    }
    
    func callForFC(){
        setupFC(completionHandler: {assignValue in
            if let assignValue =  assignValue{
                self.assign = assignValue
            }
            DispatchQueue.main.async(execute: {
                    self.setupView()
                }
            )})
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        fetchRC =  nil
    }
    
    func setupFC(completionHandler: @escaping (Bool?)->Void){
       
        let fetch = NSFetchRequest<Student>(entityName: "Student")
        let predicate = NSPredicate(format: "ANY book == %@", book)
        fetch.predicate = predicate
        do {
            self.student = try dataControl.viewContext.fetch(fetch)
            if student.count == 1{
                  self.studentID = student[0].id
            completionHandler(true)
            }else{
                  self.studentID = ""
                completionHandler(false)
            }
        } catch {
            print("Failed to retrieve record")
            print(error)
        }
  
    }
    
    func setupView() {
        if self.assign{
        iView.assignL.text = " \" \(book.title ?? "") \" is assigned to"
            iView.studentID.isHidden = false
            iView.studentID.text = self.studentID
            iView.enterStudentID.isHidden = true
            iView.enter.setTitle("Return", for: .normal)
        }else{
            iView.assignL.text = "Assign \" \(book.title ?? "") \" to"
            iView.enterStudentID.isHidden = false
          iView.enter.setTitle("Enter", for: .normal)
           iView.studentID.isHidden = true
        }
       
    }
    
    @IBAction func pressEnter(_ sender: Any) {
    if !self.assign{
        self.studentID = iView.enterStudentID.text ?? ""
        assignBook()
       }else{
        returnBook()
        }
         self.callForFC()
    }
    func assignBook(){
        
        book.assigned = true
        let studentId = Student(context: dataControl.viewContext)
        book.assignedTo = studentId
        studentId.id = self.studentID
        
        try? dataControl.viewContext.save()
    }
    
    func returnBook(){
        book.assigned = false
        let studentId = Student(context: dataControl.viewContext)
        book.assignedTo = nil
        studentId.id = nil
        try? dataControl.viewContext.save()
    }
}
