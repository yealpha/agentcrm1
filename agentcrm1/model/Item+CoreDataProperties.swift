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

    @NSManaged public var birthday: Date?
    @NSManaged public var communicationAddress: String?
    @NSManaged public var demand: String?
    @NSManaged public var email: String?
    @NSManaged public var hobby: String?
    @NSManaged public var homeAddress: String?
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var phone: String?
    @NSManaged public var zipCode: String?

}

extension Item : Identifiable {

}
