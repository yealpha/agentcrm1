//
//  HouseRequirement+CoreDataProperties.swift
//  agentcrm1
//
//  Created by Max Qiu on 6/19/23.
//
//

import Foundation
import CoreData


extension HouseRequirement {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HouseRequirement> {
        return NSFetchRequest<HouseRequirement>(entityName: "HouseRequirement")
    }

    @NSManaged public var customerID: Int32
    @NSManaged public var requirementID: Int64
    @NSManaged public var targetArea: String?
    @NSManaged public var targetBathNum: Int16
    @NSManaged public var targetBedNum: Int16
    @NSManaged public var targetHouseType: String?
    @NSManaged public var notes: String?

}

extension HouseRequirement : Identifiable {

}
