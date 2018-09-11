//
//  Note+CoreDataProperties.swift
//  CoolNotes
//
//  Created by Anurita Srivastava on 13/03/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note");
    }

    @NSManaged public var creationDate: Date?
    @NSManaged public var text: String?
    @NSManaged public var notebook: Notebook?

}
