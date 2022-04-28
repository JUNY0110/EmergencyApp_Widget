//
//  NameField.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/27.
//

import SwiftUI

struct NameField: View {

    @State private var name: String = ""

    var body: some View {
        VStack{
            HStack{
                Text("이름")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Spacer()
                TextField("이름", text: self.$name)
                    .frame(width: 150, alignment: .trailing)
                    .multilineTextAlignment(.trailing)
            }
            Divider()
        }

    }
}

struct NameField_Previews: PreviewProvider {
    static var previews: some View {
        NameField()
    }
}
