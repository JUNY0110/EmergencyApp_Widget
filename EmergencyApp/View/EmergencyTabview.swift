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
    @FetchRequest(entity: PersonalInfoEntity, sortDescriptors: []) var PersonalInfoData: FetchedResults<PersonalInfoEntity>
    
//    @State var selection: Tabs = .info
    
    @State var text1: String = UserDefaults.standard.string(forKey: "TEXT_KEY") ?? ""
    @State var text2: String = UserDefaults.standard.string(forKey: "EMER_KEY") ?? ""
    @State var text3: String = UserDefaults.standard.string(forKey: "SPARE_KEY") ?? ""

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
//                    .tag(Tabs.info)
//                    .navigationBarTitle(selection.rawValue, displayMode: .inline)
               
                SecondView()
                    .padding(.horizontal, 20)

                    .tabItem{
                        Image(systemName: "pills.fill")
                        Text("사진")
                    }
//                    .tag(Tabs.photo)
//                    .navigationBarTitle(selection.rawValue, displayMode: .inline)

                
                ThirdView()
                    .tabItem{
                        Image(systemName: "waveform")
                        Text("녹음")
                    }
//                    .tag(Tabs.record)
//                    .navigationBarTitle(selection.rawValue, displayMode: .inline)
                    
                
                ForthView()
                    .padding(.horizontal, 20)

                    .tabItem{
                        Text("위젯")
                    }
//                    .tag(Tabs.widget)
//                    .navigationBarTitle(selection.rawValue, displayMode: .inline)
            }

            
            
             
        
    }
}

struct EmergencyTapview_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyTabView()
    }
}
