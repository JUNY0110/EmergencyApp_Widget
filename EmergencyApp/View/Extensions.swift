//
//  Extensions.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/09.
//

import SwiftUI

extension Date {
    func toString( dateFormat format  : String ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension Color {
    static let LaunchRed: Color = Color(red: 255/255, green: 106/255, blue: 95/255)
}
