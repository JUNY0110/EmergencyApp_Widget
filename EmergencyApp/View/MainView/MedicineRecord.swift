////
////  MedicineRecord.swift
////  EmergencyApp
////
////  Created by 지준용 on 2022/04/27.
////
//
//import SwiftUI
//
//struct MedicineRecord: View {
//    
//    @State private var medicine: String = "복용중인 약 이름을 잘 모르시겠다면, 알약버튼을 눌러 사진을 등록해주세요."
//    
//    var body: some View {
//        VStack{
//            HStack{
//                Text("복용중인 약")
//                    .font(.system(size: 20, weight: .bold, design: .rounded))
//                Spacer()
//            }
//            
//            TextEditor(text: self.$medicine)
//                .foregroundColor(self.medicine == "복용중인 약 이름을 잘 모르시겠다면, 알약버튼을 눌러 사진을 등록해주세요." ? .gray: .primary)
//                .onTapGesture {
//                  if self.medicine == "복용중인 약 이름을 잘 모르시겠다면, 알약버튼을 눌러 사진을 등록해주세요." {
//                    self.medicine = ""
//                  }
//                }
//                .frame(width: .infinity, height: 200)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(.gray, lineWidth: 1)
//                )
//                .disableAutocorrection(true)
//        }
//        
//    }
//}
//
//struct MedicineRecord_Previews: PreviewProvider {
//    static var previews: some View {
//        MedicineRecord()
//    }
//}
