//
//  TestFirst.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/05.
//

import Foundation

struct Emoji: Identifiable, Codable {
    let icon: String
    let name: String
    let description: String
    
    var id: String{icon}
}


