//
//  DataList.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/26.
//

import SwiftUI

//struct EmergencyData: Identifiable {
//    var id = UUID()
//    var name: String
//    var bloodType: String
//    var emergencyContact: String
//    var spareContact: String
//    var disease: String
//}
//
//var emrgencyData = [
//    EmergencyData(name: "Eddy", bloodType: "A+", emergencyContact: "119", spareContact: "010-3184-3444", disease: "당뇨"
//    )
//]


struct MedicineRecordData: Identifiable, Hashable {
    var id = UUID()
    var image: String
    
}

var medicineRecordData = [
    MedicineRecordData(image: "Image1"),
    MedicineRecordData(image: "Image2"),
    MedicineRecordData(image: "Image3"),
    MedicineRecordData(image: "Image4"),
    MedicineRecordData(image: "Image5"),
    MedicineRecordData(image: "Image6"),
    MedicineRecordData(image: "Image7"),
    MedicineRecordData(image: "Image8")
]
