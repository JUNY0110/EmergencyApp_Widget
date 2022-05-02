//
//  RecordList.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/02.
//

import SwiftUI

struct RecordingList: View {
    @ObservedObject var audioRecorder: AudioRecorder
    
    var body: some View {
//        Text("진료 및 처방에 대한 음성을 기록하는 공간입니다.")
    
        List{
            Text("Empty List")
        }
    }
}
//if audioRecorder.recording == false {
//    Button(action: {
//        print("Start recording")
//    }) {
//        Image(systemName: "record.circle")
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 50, height: 50)
//            .clipped()
//            .foregroundColor(.red)
//    }
//} else {
//    Button(action: {
//        print("Stop Recording")
//    }){
//        Image(systemName: "stop.circle")
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 50, height: 50)
//            .clipped()
//            .foregroundColor(.black)
//    }
//}

struct RecordList_Previews: PreviewProvider {
    static var previews: some View {
        RecordingList(audioRecorder: AudioRecorder())
    }
}
