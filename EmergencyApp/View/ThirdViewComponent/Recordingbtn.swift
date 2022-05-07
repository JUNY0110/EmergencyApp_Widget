//
//  Recordbtn.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/07.
//

import SwiftUI

let Recorder = RecorderView(audioRecorder: AudioRecorder())

struct Recordingbtn: View {
    @ObservedObject var audioRecorder: AudioRecorder

    var body: some View {
        if audioRecorder.recording == false {
        
            Button(action: {
            
                self.audioRecorder.startRecording()
                print("Start recording")
            }) {
                HStack{
                    Image(systemName: "mic.fill")
                    Text("음성기록하기")
                        .font(.system(size: 20, weight: .regular))
                }
                .frame(width: 350, height: 40)
                .background(Color.LaunchRed)
                .foregroundColor(.white)
                .cornerRadius(20)
                .padding(.horizontal)
                .padding(.bottom,10)
            }
        } else {
            Button(action: {
                self.audioRecorder.stopRecording()
                print("Stop Recording")
                
            }){
                HStack{
                    Image(systemName: "stop.circle")
                    Text("기록저장하기")
                        .font(.system(size: 20, weight: .regular))
                }
            }
            .frame(width: 350, height: 40)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
            .padding(.horizontal)
            .padding(.bottom,10)
        }    }
}

struct Recordingbtn_Previews: PreviewProvider {
    static var previews: some View {
        Recordingbtn(audioRecorder: AudioRecorder())
    }
}
