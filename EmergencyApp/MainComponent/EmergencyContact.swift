//
//  EmergencyContact.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/27.
//

import SwiftUI

struct EmergencyContact: View {
    @State private var emergencyContact: String = ""

    var body: some View {
        HStack{
            Text("비상연락처")
                .font(.system(size: 20, weight: .bold, design: .rounded))
            Spacer()
            TextField("119", text: self.$emergencyContact)
                .frame(width: 150, alignment: .trailing)
                .multilineTextAlignment(.trailing)
        }        
    }
}

struct EmergencyContact_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyContact()
    }
}
