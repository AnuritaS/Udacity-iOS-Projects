//
//  csvParser.swift
//  LibraryManagementSystem
//
//  Created by Anurita Srivastava on 11/09/18.
//  Copyright © 2018 Anurita Srivastava. All rights reserved.
//

import Foundation
import CoreData

class setUpCoreData{
    var dataControl: DataController!
    
    func createnewsEntityFrom(array: [Article], completion: @escaping (Bool) -> Void) {
        if array.count == 0{
        completion(true)
            return
        }
        
        let managedObjectContext = dataControl.viewContext
        let lesserCount = min(2, array.count-1)
        for i in 0...lesserCount {
        let news = array[i]
            let newsEnt = NSEntityDescription.insertNewObject(forEntityName: "News", into: managedObjectContext) as? News
            
            newsEnt?.title = news.title
            newsEnt?.author = news.author
            newsEnt?.descriptionField = news.descriptionField
            newsEnt?.publishedAt = news.publishedAt
           // newsEnt?.source = news.source
            newsEnt?.url = news.url
            newsEnt?.urlToImage = news.urlToImage
            
            do {
                try dataControl.viewContext.save()
                completion(true)
            } catch let error {
                print(error)
                completion(false)
                }
            }
    }
    
    func clearData() {
        let managedObjectContext = dataControl.viewContext
        let fetchRequest = NSFetchRequest<News>(entityName: "News")
        
        do{
            let objects = try managedObjectContext.fetch(fetchRequest) as? [News]
            _ = objects.map{$0.map{managedObjectContext.delete($0)}}
        }catch(let error){
            print("cant delete", error.localizedDescription)
        }
        
    }
}
