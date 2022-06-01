////
////  SaveContact.swift
////  EmergencyApp
////
////  Created by 지준용 on 2022/05/25.
////
//
import SwiftUI

struct SaveContact: View {

//    @Binding var text2: String
//    @Binding var text3: String
    @Binding var emergencyContact: String
    @Binding var spareContact: String

    var body: some View {
        VStack{
            HStack{
                Text("비상연락처1")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Spacer()

                Text(emergencyContact)
//                TextField("000-0000-0000", text: $emergencyContact)
//                    .frame(width: 150, alignment: .trailing)
//                    .multilineTextAlignment(.trailing)
//                    .submitLabel(.done)
//                    .keyboardType(.decimalPad)
            }
            Divider()

            HStack{
                Text("비상연락처2")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Spacer()
                Text(spareContact)
            }
            Divider()
        }

    }
}
