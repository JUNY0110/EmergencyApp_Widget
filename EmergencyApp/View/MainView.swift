//
//  SwiftUIView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/26.
//

import SwiftUI

struct MainView: View {


    var body: some View {
        ScrollView{
            
            VStack{
                Group{
                    ProfileImage()
                    
                    NameField()
                    
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
                
                Group{
                    MedicalRecord()
                        
                    Divider()
                    
                    MedicineRecord()
                }
            }
            .padding(40)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}