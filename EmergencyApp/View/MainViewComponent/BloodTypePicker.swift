//
//  BloodTypePicker.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/27.
//

import SwiftUI

struct BloodTypePicker: View {
    @State private var bloodType = ["A+","B+","AB+","O+","A-","B-","AB-","O-"]
    @State var selectedBloodType = 0
    
    var body: some View {
     
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
        
    }
}

struct BloodTypePicker_Previews: PreviewProvider {
    static var previews: some View {
        BloodTypePicker()
    }
}
