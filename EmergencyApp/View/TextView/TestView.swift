////
////  TestView.swift
////  EmergencyApp
////
////  Created by 지준용 on 2022/05/24.
////
//
//import SwiftUI
//
//struct TestView: View {
//    var body: some View {
//        VStack {
//            ScrollView(.vertical, showsIndicators: false, content: {
//                Group {
//                    ZStack{
//                        ProfileImage()
//                        Button(action: {
//                            NameField(text: $text2, name: $name2)
//                            print("22")
//                        }){
//                            Text("편집")
//                    
//                        }
//                    }
//                    
//                    SaveNameView()
//                    
//                    BirthPicker()
//                    Divider()
//                    
//                    BloodTypePicker()
//                    Divider()
//                    
//                    EmergencyContact()
//                    //위젯 클릭 시 연락이 가는 번호
//                    Divider()
//                    
//                    SpareContact()
//                    //위젯에 적혀있는 번호
//                    Divider()
//                }
//                
//                Group {
//                    MedicalRecord()
//                    
//                    Divider()
//                    
//                    MedicineRecord()
//                }
//            })
//            .onTapGesture {
//                hideKeyboard()
//                
//            }
//        }
////        NavigationLink(destination: NameField(text: $text2, name: $name2)){Text("편집")
//            
//        
//    }
//}
//
//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//    }
//}
