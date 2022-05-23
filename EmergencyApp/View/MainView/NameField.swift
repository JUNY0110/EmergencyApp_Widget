//
//  NameField.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/27.
//

import SwiftUI

struct NameField: View {


    @State var text: String = UserDefaults.standard.string(forKey: "TEXT_KEY") ?? ""
    @State var name: String = ""

//    func sayHello(name:String) {
//    }

    var body: some View {
        
        VStack{
            HStack{
                Text("이름")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Spacer()
                
            
                TextField("이름", text: $name)
                    .frame(width: 150, alignment: .trailing)
                    .multilineTextAlignment(.trailing)
                    .submitLabel(.done)
                
                    
//                    Text(text)
//                        .multilineTextAlignment(.trailing)
                
                
                Button(action: {
                    UserDefaults.standard.set(name, forKey: "TEXT_KEY")
                    text = name
                    print("dada")
                }){
                    Text("Save Data")
                }
            }
            Divider()
        }
    }
}


//
//
//
//
//
//struct NameField_Previews: PreviewProvider {
//    static var previews: some View {
//        NameField()
//    }
//}
//
//
