//
//  SaveNameView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/24.
//

import SwiftUI

struct SaveNameView: View {
    
    @State var text: String = UserDefaults.standard.string(forKey: "TEXT_KEY") ?? ""
    @State var name: String = ""

    
    var body: some View {
        VStack{
            HStack{
                Text("이름")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Spacer()

                    
                Text(text)
                    .frame(width: 150, alignment: .trailing)
                    .multilineTextAlignment(.trailing)
                
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




struct SaveNameView_Previews: PreviewProvider {
    static var previews: some View {
        SaveNameView()
    }
}
