//
//  Tapview.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/27.
//

import SwiftUI

struct EmergencyTabView: View {
    var body: some View {
        NavigationView{
            TabView{
                MainView()
                    .tabItem{
                        Image(systemName: "house")
                        Text("의료정보")
                    }
                
                SecondView()
                    .tabItem{
                        Image(systemName: "pills.fill")
                        Text("사진")
                    }
                
                RecorderView(audioRecorder: AudioRecorder())
                    .tabItem{
                        Image(systemName: "waveform")
                        Text("녹음")
                    }
                ForthView()
                    .tabItem{
                        
                        Text("위젯")
                    }
            }
        }
    }
}

struct EmergencyTapview_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyTabView()
    }
}
