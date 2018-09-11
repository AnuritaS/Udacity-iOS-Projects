//
//  dataController.swift
//  LibraryManagementSystem
//
//  Created by Anurita Srivastava on 11/09/18.
//  Copyright © 2018 Anurita Srivastava. All rights reserved.
//

import Foundation
import CoreData

class DataController{
    
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    init(modelName: String){
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    func load(completion: (()-> Void)? = nil){
        persistentContainer.loadPersistentStores(completionHandler: {storeDesc, error in
            guard error == nil else{
                fatalError(error!.localizedDescription)
            }
            self.autoSave(interval: 3)
            completion?()
        })
        
    }
    
}

extension DataController{
    func autoSave(interval:TimeInterval = 30){
        guard interval > 0 else{
            print("cannot set negative autosave interval")
            return
        }
        if viewContext.hasChanges{
            try? viewContext.save()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+interval, execute: {
            self.autoSave(interval: interval)
        })
    }
}
