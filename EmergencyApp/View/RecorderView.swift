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

//        NavigationView{
            VStack{

                RecordingList(audioRecorder: AudioRecorder())
                
                
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
                }
                    
                
                
//
//
//                if audioRecorder.recording == false {
//                    Button(action: {
//                        self.audioRecorder.startRecording()
//                        print("Start recording")
//                    }) {
//                        Image(systemName: "record.circle")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 50, height: 50)
//                            .clipped()
//                            .foregroundColor(.red)
//                    }
//                } else {
//
//
//                    Button(action: {
//                        self.audioRecorder.stopRecording()
//                        print("Stop Recording")
//                    }){
//                        Image(systemName: "stop.circle")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 50, height: 50)
//                            .clipped()
//                            .foregroundColor(.black)
//                    }
//                }
                    
            }
//            .padding(10)
//            .navigationBarTitle("음성 기록")
//        }       

    }
        


}


struct RecordingRow: View {
    var audioURL: URL
    
    @ObservedObject var audioPlayer = AudioPlayer()
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 15)
//                .frame(width: .infinity, height: .infinity)
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))

            
            VStack{
                if audioPlayer.isPlaying == false {
                    Button(action: {
                        self.audioPlayer.startPlayback(audio: audioURL)
                    }){
                        Image(systemName: "play.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 100)
                    }
                } else {
                    Button(action: {
                        self.audioPlayer.stopPlayback()
                    }){
                        Image(systemName: "stop.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 100)
                    }
                }
                Spacer()
                
                Text("\(audioURL.lastPathComponent)")
            }
            
            .padding(10)
            
        }
    }
}

struct MedicalRecorder_Previews: PreviewProvider {
    static var previews: some View {
        RecorderView(audioRecorder: AudioRecorder())
    }
}
