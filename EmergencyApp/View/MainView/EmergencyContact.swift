//
//  EmergencyContact.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/27.
//

import SwiftUI

struct EmergencyContact: View {
    
    @AppStorage("emergencyContact") var emergencyContact: String = ""
    @AppStorage("spareContact") var spareContact: String = ""
    
    var body: some View {
        VStack{
            HStack{
                Text("비상연락처1")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Spacer()
       
                TextField("000-0000-0000", text: $emergencyContact)
                    .frame(width: 150, alignment: .trailing)
                    .multilineTextAlignment(.trailing)
                    .submitLabel(.done)
                    .keyboardType(.decimalPad)
            }
            Divider()
            
            HStack{
                Text("비상연락처2")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Spacer()
                TextField("000-0000-0000", text: $spareContact)
                    .frame(width: 150, alignment: .trailing)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Divider()
        }
        
    }
}
