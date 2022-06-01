//
//  Tapview.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/27.
//

import SwiftUI

//enum Tabs: String {
//    case info = "기본정보"
//    case photo = "진단서 및 복용약"
//    case record = "진료 및 처방기록"
//    case widget = "위젯설정"
//}

struct EmergencyTabView: View {

    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: PersonalInfoEntity.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \PersonalInfoEntity.name, ascending: false),
        NSSortDescriptor(keyPath: \PersonalInfoEntity.birth, ascending: false),
        NSSortDescriptor(keyPath: \PersonalInfoEntity.bloodType, ascending: false),
        NSSortDescriptor(keyPath: \PersonalInfoEntity.emergencyContact, ascending: false),
        NSSortDescriptor(keyPath: \PersonalInfoEntity.spareContact, ascending: false),
        NSSortDescriptor(keyPath: \PersonalInfoEntity.photoImage, ascending: false),
        NSSortDescriptor(keyPath: \PersonalInfoEntity.medicalRecord, ascending: false),
        NSSortDescriptor(keyPath: \PersonalInfoEntity.medicineRecord, ascending: false)]) var personalInfo: FetchedResults<PersonalInfoEntity>
        
    @State var name: String = ""
    @State var emergencyContact: String = ""
    @State var spareContact: String = ""
    
    var body: some View {
  
                
            TabView(){

                MainView()

                    .padding(.horizontal, 20)
                    .tabItem{
                        Image(systemName: "house")
                        Text("의료정보")
                        
                    }
               
                SecondView()
                    .padding(.horizontal, 20)
                    .tabItem{
                        Image(systemName: "pills.fill")
                        Text("사진")
                    }

                
                ThirdView()
                    .tabItem{
                        Image(systemName: "waveform")
                        Text("녹음")
                    }
                    
                
                ForthView()
                    .padding(.horizontal, 20)
                    .tabItem{
                        Text("위젯")
                    }
            }
    }
}

struct EmergencyTapview_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyTabView()
    }
}
