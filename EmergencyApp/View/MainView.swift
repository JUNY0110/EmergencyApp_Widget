//
//  SwiftUIView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/26.
//

import SwiftUI

struct MainView: View {


    
    var body: some View {
        
        VStack {
            ScrollView(.vertical, showsIndicators: false, content: {
                Group {
                    ProfileImage()
                    
                    SaveNameView()
                    
                    BirthPicker()
                    Divider()
                    
                    BloodTypePicker()
                    Divider()
                    
                    EmergencyContact()
                    //위젯 클릭 시 연락이 가는 번호
                    Divider()
                    
                    SpareContact()
                    //위젯에 적혀있는 번호
                    Divider()
                }
                
                Group {
                    MedicalRecord()
                    
                    Divider()
                    
                    MedicineRecord()
                }
            })
            .onTapGesture {
                hideKeyboard()
                
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
