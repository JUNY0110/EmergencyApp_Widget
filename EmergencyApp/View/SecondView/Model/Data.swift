//
//  DataList.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/26.
//

import SwiftUI

extension Color {
    static let LaunchRed: Color = Color(red: 255/255, green: 106/255, blue: 95/255)
}

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
