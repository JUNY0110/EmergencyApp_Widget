//
//  SaveNameView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/24.
//

import SwiftUI

struct SavePersonalInfo: View {
    
    @Binding var text: String
    @Binding var name: String
    
    @State var wakeUp = Date()

    @State var bloodType = ["A+","B+","AB+","O+","A-","B-","AB-","O-"]
    @State var selectedBloodType = 0
    
    var body: some View {
        VStack{
            HStack{
                Text("이름")
                    .font(.system(size: 20, weight: .bold, design: .rounded))

                Spacer()

                Text(text)
                    .frame(width: 150, alignment: .trailing)
                    .multilineTextAlignment(.trailing)
            }
            Divider()
            
            HStack{
                Text("생년월일")
                    .font(.system(size: 20, weight: .bold, design: .rounded))

                Spacer()
                
                Text("\(Date())")
                    .frame(width: 150, alignment: .trailing)
                    .multilineTextAlignment(.trailing)
            }
            
            Divider()
            
//            abo()
            HStack{
                Text("혈액형")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Spacer()
//                Text("\(self.bloodType")")
//                Picker(selection: $selectedBloodType, label: Text("혈액형")) {
//                    ForEach(0..<bloodType.count) {
//                        Text(self.bloodType[$0])
//                    }
//                }
//                .pickerStyle(.automatic)
//                .foregroundColor(.red)

            }
            Divider()
        }
    }
}

//
//
//
//struct SaveNameView_Previews: PreviewProvider {
//    static var previews: some View {
//        SaveNameView()
//    }
//}
