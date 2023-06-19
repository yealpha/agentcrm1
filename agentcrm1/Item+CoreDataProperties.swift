//
//  Item+CoreDataProperties.swift
//  agentcrm1
//
//  Created by Max Qiu on 6/19/23.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var timestamp: Date?

}

extension Item : Identifiable {

}
