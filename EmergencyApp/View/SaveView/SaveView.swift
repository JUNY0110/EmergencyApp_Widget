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
    @State var shouldPopToRootView: Bool = false
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
            .navigationBarTitle(Text("기본 정보"), displayMode: .inline)
            
            .navigationBarItems(trailing: NavigationLink(destination: MainView(text: $text, name: $name, shouldPopToRootView: self.$shouldPopToRootView), isActive: self.$shouldPopToRootView){
                Text("편집")
            }.isDetailLink(false)
            )
            
            
//            .navigationBarItems(trailing: Button(action: {
//                MainView()
//            }){
//                Text("편집")
//            })
//            .toolbar{
//                ToolbarItem(placement: .navigationBarTrailing){
//                    Button(action: {
//                        MainView()
//                    }){
//                        Text("편집")
//                    }
//
//                    NavigationLink(destination: MainView()){
//                        Text("편집")
//                    }
//                }
//            }
        }
        
    }
}
