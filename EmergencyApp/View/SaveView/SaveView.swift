//
//  SaveView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/25.
//
//
import SwiftUI

struct SaveView: View {
    
    @Binding var text: String
    @Binding var name: String
    @Binding var emergencyContact: String
    @Binding var spareContact: String
    
    var body: some View {
        
        NavigationView{
            VStack {
                ScrollView(.vertical, showsIndicators: false, content: {

                ProfileImage()
                
                SavePersonalInfo(text: $text, name: $name)
                
                SaveContact(emergencyContact: $emergencyContact, spareContact: $spareContact)
                
                MedicalRecord()
                })
            }
//            .navigationBarHidden(true)
//            .navigationBarItems(trailing: NavigationLink(destination: MainView(), label: {
//                Text("저장")
//            })
//            )
                
        }
    }
}
//
//struct SaveView_Previews: PreviewProvider {
//    static var previews: some View {
//        SaveView(text: $test, name: <#T##Binding<String>#>, emergencyContact: <#T##Binding<String>#>, spareContact: <#T##Binding<String>#>)
//    }
//}
