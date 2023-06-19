//
//  HouseViewing+CoreDataProperties.swift
//  agentcrm1
//
//  Created by Max Qiu on 6/19/23.
//
//

import Foundation
import CoreData


extension HouseViewing {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HouseViewing> {
        return NSFetchRequest<HouseViewing>(entityName: "HouseViewing")
    }

    @NSManaged public var comments: String?
    @NSManaged public var customerID: Int32
    @NSManaged public var followUpComments: String?
    @NSManaged public var followUpDate: Date?
    @NSManaged public var followUpRequired: Bool
    @NSManaged public var houseID: Int32
    @NSManaged public var viewingDate: Date?
    @NSManaged public var viewingID: Int64

}

extension HouseViewing : Identifiable {

}
