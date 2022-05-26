//
//  SwiftUIView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/26.
//

import SwiftUI

struct MainView: View {

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
                    
                    PersonalInfo()
                    
                    EmergencyContact()

                    MedicalRecord()
                })
            }
            .navigationBarTitle(Text("기본 정보"), displayMode: .inline)
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
