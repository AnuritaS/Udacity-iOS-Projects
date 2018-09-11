//
//  Notebook+CoreDataClass.swift
//  CoolNotes
//
//  Created by Anurita Srivastava on 13/03/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import Foundation
import CoreData


public class Notebook: NSManagedObject {
    convenience init(name: String, context: NSManagedObjectContext) {
        if let ent = NSEntityDescription.entity(forEntityName: "Notebook", in: context){
            self.init(entity: ent, insertInto: context)
            self.creationDate = Date()
            self.name = name
            
        }else{
            fatalError("Unable to find entity")
        }
    }
    
    var humanReadable : String{
        get{
            let fm = DateFormatter()
            fm.timeStyle = .none
            fm.dateStyle = .short
            fm.doesRelativeDateFormatting = true
            fm.locale = Locale.current
            return fm.string(from: creationDate!)
        }
    }
}
