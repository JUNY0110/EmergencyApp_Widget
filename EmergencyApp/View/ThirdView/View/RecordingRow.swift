//
//  RecordingRow.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/07.
//

import SwiftUI


struct RecordingRow: View {
    var audioURL: URL
    
    @ObservedObject var audioPlayer = AudioPlayer()
    
    var body: some View{
        
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))

            HStack{
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
                
                VStack(alignment: .trailing){
                    Text("장소/날짜")
                    Text("\(audioURL.lastPathComponent)")
                }
                
            }
            .padding(10)
        }
    }
}
