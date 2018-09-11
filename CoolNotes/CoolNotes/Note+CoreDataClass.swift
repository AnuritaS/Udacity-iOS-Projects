//
//  Note+CoreDataClass.swift
//  CoolNotes
//
//  Created by Anurita Srivastava on 13/03/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import Foundation
import CoreData


public class Note: NSManagedObject {

    convenience init(text: String = "New Note", context: NSManagedObjectContext) {
        if let ent = NSEntityDescription.entity(forEntityName: "Note", in: context){
            self.init(entity :ent, insertInto: context)
            self.text = text
            self.creationDate = Date()
        }
    else{
    fatalError("Unable to find entity name!")
    }
   }
 
}
