//
//  AssetIncome+CoreDataProperties.swift
//  agentcrm1
//
//  Created by Max Qiu on 6/19/23.
//
//

import Foundation
import CoreData


extension AssetIncome {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AssetIncome> {
        return NSFetchRequest<AssetIncome>(entityName: "AssetIncome")
    }

    @NSManaged public var annualIncome: Int32
    @NSManaged public var cash: Int32
    @NSManaged public var customerID: Int32
    @NSManaged public var otherAssets: Int32
    @NSManaged public var stockAssets: Int32

}

extension AssetIncome : Identifiable {

}
