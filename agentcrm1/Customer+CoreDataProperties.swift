//
//  Customer+CoreDataProperties.swift
//  agentcrm1
//
//  Created by Max Qiu on 6/19/23.
//
//

import Foundation
import CoreData


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var birthday: Date?
    @NSManaged public var customerID: Int32
    @NSManaged public var email: String?
    @NSManaged public var emergencyContact: String?
    @NSManaged public var firstContactTime: Date?
    @NSManaged public var gender: String?
    @NSManaged public var lifecycleStage: String?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var preferences: String?
    @NSManaged public var source: String?
    @NSManaged public var status: String?
    @NSManaged public var wechat: String?
    @NSManaged public var hobby: String?
    @NSManaged public var notes: String?

}

extension Customer : Identifiable {

}
