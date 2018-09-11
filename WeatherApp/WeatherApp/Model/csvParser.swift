//
//  csvParser.swift
//  LibraryManagementSystem
//
//  Created by Anurita Srivastava on 11/09/18.
//  Copyright © 2018 Anurita Srivastava. All rights reserved.
//

import Foundation
import CoreData
extension AppDelegate{
    
    func preloadData () {
        // Retrieve data from the source file
        if let contentsOfURL = Bundle.main.url(forResource: "booklist", withExtension: "json") {
            
            // Remove all the menu items before preloading
            removeData()
            
            do {
                let data = try Data(contentsOf: contentsOfURL, options: .mappedIfSafe)
                let items = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
              
                if let items = items as? Array<Dictionary<String,AnyObject>>{
                    // Preload the books
                    let managedObjectContext = dataControl.viewContext
                    for item in items {
                        let book = NSEntityDescription.insertNewObject(forEntityName: "Books", into: managedObjectContext) as! Books
                        book.title = item["title"] as? String
                        book.author = item["author"] as? String
                        
                        try? managedObjectContext.save()
                    }
                }
            }
            catch {
                // handle error
                fatalError("Cannot parse jSON")
            }
        }
    }
    
    func removeData () {
        // Remove the existing items
        let managedObjectContext = dataControl.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Books")
     
        var books = [Books]()
        do{
            books = try managedObjectContext.fetch(fetchRequest) as! [Books]
        }catch{
            print("error in books")
        }
   
            
            for book in books {
                managedObjectContext.delete(book)
            }
        
    }
    
}
