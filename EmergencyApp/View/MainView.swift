//
//  SwiftUIView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/26.
//

import SwiftUI

struct MainView: View {

    @State var text: String = UserDefaults.standard.string(forKey: "TEXT_KEY") ?? ""
    @State var name: String = ""
    
    var body: some View {
        
        VStack {
            ScrollView(.vertical, showsIndicators: false, content: {
                Group {
                    ProfileImage()

                    PersonalInfo(text: $text, name: $name)
//                    SavePersonalInfo(text: $text, name: $name)

                    EmergencyContact()

                    MedicalRecord()
                }
            })
            .onTapGesture {
                hideKeyboard()
            }
        }
        NavigationLink(destination: PersonalInfo(text: $text, name:$name)){
            Text("저장")
        }
//        NavigationLink(destination: NameField(text: $text2, name: $name2)){Text("편집")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
