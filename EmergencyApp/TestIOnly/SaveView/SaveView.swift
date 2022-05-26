////
////  SaveView.swift
////  EmergencyApp
////
////  Created by 지준용 on 2022/05/25.
////
////
//import SwiftUI
//
//struct SaveView: View {
//    
//    @Binding var text1: String
//    @Binding var text2: String
//    @Binding var text3: String
////
//    @Binding var name: String
//    @Binding var emergencyContact: String
//    @Binding var spareContact: String
//    
//    @State var isPresented = false
//    
//    @State var shouldPopToRootView: Bool = false
//    
//    
//    var body: some View {
//        
//        NavigationView{
//            VStack {
//                ScrollView(.vertical, showsIndicators: false, content: {
//
//                ProfileImage()
//                
//                SavePersonalInfo(text: $text1)
//                
//                SaveContact(emergencyContact: $emergencyContact, spareContact: $spareContact)
//                
//                MedicalRecord()
//                })
//            }
//            .navigationBarTitle(Text("기본 정보"), displayMode: .inline)
//            .toolbar{
//                ToolbarItem(placement: .navigationBarTrailing){
//
//                    Button(action: {
//                        UserDefaults.standard.set(name, forKey: "TEXT_KEY")
//                        text1 = name
//
//                        UserDefaults.standard.set(emergencyContact, forKey: "EMER_KEY")
//                        text2 = emergencyContact
//
//                        UserDefaults.standard.set(spareContact, forKey: "SPARE_KEY")
//                        text3 = spareContact
//
//
////                        SavePersonalInfo(text: $text, name: $name)
//                        self.shouldPopToRootView = false
//
//                    }){
//                        Text("저장")
//                    }
//
//                }
//
//            }
//            
//            .navigationBarItems(trailing: NavigationLink(destination: MainView(text1: $text1, text2: $text2, text3: $text3, name: $name, emergencyContact: $emergencyContact, spareContact: $spareContact, shouldPopToRootView: self.$shouldPopToRootView), isActive: self.$shouldPopToRootView){
//                Text("편집")
//            }
////                .isDetailLink(false)
//            )
//        }
//        
//    }
//}
