//
//  SwiftUIView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/26.
//

import SwiftUI

struct MainView: View {

    @Binding var text1: String
    @Binding var text2: String
    @Binding var text3: String
    
    @Binding var name: String
    @Binding var emergencyContact: String
    @Binding var spareContact: String
    
    @Binding var shouldPopToRootView: Bool
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.backward")
                Text("뒤로 가기")
            }
            .foregroundColor(.blue)
        }
    }
    
    var body: some View {
        
        NavigationView{
            VStack {
                ScrollView(.vertical, showsIndicators: false, content: {
                    
                    ProfileImage()
                    
                    PersonalInfo(text: $text1, name: $name)
                    
                    EmergencyContact(emergencyContact: $emergencyContact, spareContact: $spareContact)

                    MedicalRecord()
                })
            }
            .navigationBarItems(leading: btnBack)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    
                    Button(action: {
                        UserDefaults.standard.set(name, forKey: "TEXT_KEY")
                        text1 = name
                        
                        UserDefaults.standard.set(emergencyContact, forKey: "TEXT_KEY")
                        text2 = emergencyContact
                        
                        UserDefaults.standard.set(spareContact, forKey: "TEXT_KEY")
                        text3 = spareContact
                        
                        
//                        SavePersonalInfo(text: $text, name: $name)
                        self.shouldPopToRootView = false
                        
                    }){
                        Text("저장")
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .onTapGesture {
            hideKeyboard()
        }
    }
}
//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView(text: $text, name: $name)
//    }
//}
