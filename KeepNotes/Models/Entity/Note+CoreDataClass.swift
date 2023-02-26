//
//  Note+CoreDataClass.swift
//  
//
//  Created by Александр Борисов on 25.02.2023.
//
//

import Foundation
import CoreData

@objc(Note)
public class Note: NSManagedObject {
    convenience init() {
        self.init(
            entity: CoreDataManager.instance.entityForName(entityName: "Note"),
            insertInto: CoreDataManager.instance.context)
    }
}
