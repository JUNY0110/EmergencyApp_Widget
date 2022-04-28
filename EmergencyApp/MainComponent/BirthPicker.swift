//
//  BirthPicker.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/27.
//

import SwiftUI

struct BirthPicker: View {

    @State private var wakeUp = Date()

    var body: some View {
        HStack{
            Text("생년월일")
                .font(.system(size: 20, weight: .bold, design: .rounded))

            Spacer()
            
            DatePicker("생년월일", selection: $wakeUp, in: ...Date(),displayedComponents: .date)
                .foregroundColor(.black)
                .labelsHidden()
        }
    }
}

struct BirthPicker_Previews: PreviewProvider {
    static var previews: some View {
        BirthPicker()
    }
}
