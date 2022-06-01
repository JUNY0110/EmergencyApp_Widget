//
//  PersonalInfoEntity+CoreDataProperties.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/06/01.
//
//

import Foundation
import CoreData


extension PersonalInfoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonalInfoEntity> {
        return NSFetchRequest<PersonalInfoEntity>(entityName: "PersonalInfoEntity")
    }

    @NSManaged public var emergencyContact: String?
    @NSManaged public var name: String?
    @NSManaged public var spareContact: String?
    @NSManaged public var bloodType: String?
    @NSManaged public var birth: Date?
    @NSManaged public var medicalRecord: String?
    @NSManaged public var medicineRecord: String?
    @NSManaged public var photoImage: Data?

}

extension PersonalInfoEntity : Identifiable {

}
