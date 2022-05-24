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
//                        Button(action: {
//                            NameField(text: $text2, name: $name2)
//                            print("22")
//                        }){
//                            Text("편집")
//
//                        }
//                    }
                    
                    SaveNameView(text: $text, name: $name)
                    
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
        NavigationLink(destination: NameField(text: $text, name:$name)){
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
