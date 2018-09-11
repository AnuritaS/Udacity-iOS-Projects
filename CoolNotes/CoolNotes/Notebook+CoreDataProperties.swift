//
//  Notebook+CoreDataProperties.swift
//  CoolNotes
//
//  Created by Anurita Srivastava on 13/03/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import Foundation
import CoreData


extension Notebook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notebook> {
        return NSFetchRequest<Notebook>(entityName: "Notebook");
    }

    @NSManaged public var creationDate: Date?
    @NSManaged public var name: String?
    @NSManaged public var note: Set<Note>?

}
