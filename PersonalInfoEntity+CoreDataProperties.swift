//
//  PersonalInfoEntity+CoreDataProperties.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/27.
//
//

import Foundation
import CoreData


extension PersonalInfoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonalInfoEntity> {
        return NSFetchRequest<PersonalInfoEntity>(entityName: "PersonalInfoEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var spareContact: String?
    @NSManaged public var emergencyContact: String?

}

extension PersonalInfoEntity : Identifiable {

}

