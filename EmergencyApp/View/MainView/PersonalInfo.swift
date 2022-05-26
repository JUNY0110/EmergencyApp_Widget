//
//  NameField.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/27.
//

import SwiftUI

struct PersonalInfo: View {

    @AppStorage("name") var name = ""

    @State private var wakeUp = Date()

    @State private var bloodType = ["A+","B+","AB+","O+","A-","B-","AB-","O-"]
    @State var selectedBloodType = 0
    
    var body: some View {
        
        VStack{
            
            //이름TextField
            HStack{
                Text("이름")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Spacer()
                
                TextField("이름을 입력하세요.", text: $name)
                    .frame(width: 150, alignment: .trailing)
                    .multilineTextAlignment(.trailing)
                    .submitLabel(.done)

            }
            Divider()
            
            //생년월일Picker
            HStack{
                Text("생년월일")
                    .font(.system(size: 20, weight: .bold, design: .rounded))

                Spacer()
                
                DatePicker("생년월일", selection: $wakeUp, in: ...Date(),displayedComponents: .date)
                    .foregroundColor(.black)
                    .labelsHidden()
            }
            
            Divider()
            
//            abo()
            //혈액형Picker
            HStack{
                Text("혈액형")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Spacer()
                Picker(selection: $selectedBloodType, label: Text("혈액형")) {
                    ForEach(0..<bloodType.count) {
                        Text(self.bloodType[$0])
                    }
                }
                .pickerStyle(.automatic)
                .foregroundColor(.red)

            }
            Divider()
        }
    }
}
//    private func abo() -> some View {
//        HStack{
//            Text("혈액형")
//                .font(.system(size: 20, weight: .bold, design: .rounded))
//            Spacer()
//            Picker(selection: $selectedBloodType, label: Text("혈액형")) {
//                ForEach(0..<bloodType.count) {
//                    Text(self.bloodType[$0])
//                }
//            }
//            .pickerStyle(.automatic)
//            .foregroundColor(.red)
//
//        }
//    }
//struct PersonalInfo_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonalInfo(text: $text, name: $name)
//    }
//}
