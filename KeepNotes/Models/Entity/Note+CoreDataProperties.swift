//
//  Note+CoreDataProperties.swift
//  
//
//  Created by Александр Борисов on 25.02.2023.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var noteBody: String?
    @NSManaged public var noteHeader: String?

}
