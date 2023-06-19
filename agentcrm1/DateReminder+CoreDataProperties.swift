//
//  DateReminder+CoreDataProperties.swift
//  agentcrm1
//
//  Created by Max Qiu on 6/19/23.
//
//

import Foundation
import CoreData


extension DateReminder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DateReminder> {
        return NSFetchRequest<DateReminder>(entityName: "DateReminder")
    }

    @NSManaged public var customerID: Int32
    @NSManaged public var descrip: String?
    @NSManaged public var recurrenceRule: String?
    @NSManaged public var remindDate: Date?
    @NSManaged public var remindID: Int32

}

extension DateReminder : Identifiable {

}
