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

    @State var emergencyContact: String = ""
    @State var spareContact: String = ""
//    @State var wakeUp = UserDefaults.standard.set(Date(), forKey: "CurrentDate")

//    @State var bloodType = UserDefaults.standard.set(["A+","B+","AB+","O+","A-","B-","AB-","O-"], forKey: "ABO")
//    @State var selectedBloodType = 0
    
//    @State var emergencyContact: String = ""
//    @State var spareContact: String = ""
    
    var body: some View {
        
        NavigationView{
            VStack {
                ScrollView(.vertical, showsIndicators: false, content: {

                    
                    ProfileImage()
                    
                    
//                    Button(action: {
//
//                        UserDefaults.standard.set(name, forKey: "TEXT_KEY")
//                        text = name
//                        SavePersonalInfo(text: $text, name: $name)
//                    }){
//                        Text("Save Data")
//
//                    }
                    PersonalInfo(text: $text, name: $name)
                    
                    EmergencyContact(emergencyContact: $emergencyContact, spareContact: $spareContact)

                    MedicalRecord()
                
                })
                .onTapGesture {
                    hideKeyboard()
                }
            }
//            .navigationBarItems(trailing: NavigationLink(destination: SaveView(text: $text, name: $name, emergencyContact: $emergencyContact, spareContact: $spareContact), label: {
//                Text("저장")
//            })
//            )
        }
        
    }
}
//
//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
