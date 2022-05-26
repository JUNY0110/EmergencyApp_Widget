//
//  SaveView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/25.
//
//
import SwiftUI

struct SaveView: View {
    
    @Binding var text1: String
    @Binding var text2: String
    @Binding var text3: String
    
    @Binding var name: String
    @Binding var emergencyContact: String
    @Binding var spareContact: String
    
    @State var shouldPopToRootView: Bool = false
    
    var body: some View {
        
        NavigationView{
            VStack {
                ScrollView(.vertical, showsIndicators: false, content: {

                ProfileImage()
                
                SavePersonalInfo(text: $text1, name: $name)
                
                SaveContact(emergencyContact: $emergencyContact, spareContact: $spareContact)
                
                MedicalRecord()
                })
            }
            .navigationBarTitle(Text("기본 정보"), displayMode: .inline)
            
            .navigationBarItems(trailing: NavigationLink(destination: MainView(text1: $text1, text2: $text2, text3: $text3, name: $name, emergencyContact: $emergencyContact, spareContact: $spareContact, shouldPopToRootView: self.$shouldPopToRootView), isActive: self.$shouldPopToRootView){
                Text("편집")
            }
//                .isDetailLink(false)
            )
        }
        
    }
}
