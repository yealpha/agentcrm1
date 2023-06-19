//
//  House+CoreDataProperties.swift
//  agentcrm1
//
//  Created by Max Qiu on 6/19/23.
//
//

import Foundation
import CoreData


extension House {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<House> {
        return NSFetchRequest<House>(entityName: "House")
    }

    @NSManaged public var address1: String?
    @NSManaged public var address2: String?
    @NSManaged public var askingPrice: Int16
    @NSManaged public var bathNum: Int16
    @NSManaged public var bedNum: Int16
    @NSManaged public var city: String?
    @NSManaged public var country: String?
    @NSManaged public var houseID: Int32
    @NSManaged public var houseType: String?
    @NSManaged public var zipCode: String?

}

extension House : Identifiable {

}
