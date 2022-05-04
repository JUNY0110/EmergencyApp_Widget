//
//  MedicalRecord.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/27.
//

import SwiftUI

struct MedicalRecord: View {

    @State private var medicalRecord: String = ""
    @State private var text: String = "앓고 계신 병명을 잘 모르시겠다면, 알약버튼을 눌러 진단서를 등록해주세요."

    var body: some View {
        
//        GroupBox {
            VStack{
                HStack{
                    Text("의료 기록")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    Spacer()
    //                Image(systemName: "camera.circle")
                }
                
                TextEditor(text: self.$text)
                    .foregroundColor(self.text == "앓고 계신 병명을 잘 모르시겠다면, 알약버튼을 눌러 진단서를 등록해주세요." ? .gray: .primary)
                    .onTapGesture {
                      if self.text == "앓고 계신 병명을 잘 모르시겠다면, 알약버튼을 눌러 진단서를 등록해주세요." {
                          
                          self.text = ""
                      }
                    }
                    .frame(width: .infinity, height: 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 1)
                    )
                    .disableAutocorrection(true)
            }
    }
}

struct MedicalRecord_Previews: PreviewProvider {
    static var previews: some View {
        MedicalRecord()
    }
}
