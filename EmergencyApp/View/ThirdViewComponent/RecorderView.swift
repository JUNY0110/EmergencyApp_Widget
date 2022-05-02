//
//  MedicalRecorder.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/02.
//

import SwiftUI

let Recorder = RecorderView(audioRecorder: AudioRecorder())

struct RecorderView: View {
    @ObservedObject var audioRecorder: AudioRecorder

    
    var body: some View {

        NavigationView{
            VStack{
                RecordingList(audioRecorder: AudioRecorder())
                
                if audioRecorder.recording == false {
                    Button(action: {
                        print("Start recording")
                    }) {
                        Image(systemName: "record.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .clipped()
                            .foregroundColor(.red)
                    }
                } else {
                    Button(action: {
                        print("Stop Recording")
                    }){
                        Image(systemName: "stop.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .clipped()
                            .foregroundColor(.black)
                    }
                }
            }
            .navigationBarTitle("음성 기록")
        }
    }
}

struct MedicalRecorder_Previews: PreviewProvider {
    static var previews: some View {
        RecorderView(audioRecorder: AudioRecorder())
    }
}
