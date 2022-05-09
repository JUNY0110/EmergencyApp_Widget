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
        
                HStack{
                    VStack(alignment: .leading){
                        Text("장소")
                        Text("\(audioURL.lastPathComponent)")
                    }
                    .padding(.leading, 10)
                    
                    Spacer()
                    
                    if audioPlayer.isPlaying == false {
                        Button(action: {
                            self.audioPlayer.startPlayback(audio: self.audioURL)
                        }){
                            Image(systemName: "play.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 80)
                                .padding(.vertical, 20)
                        }
                        .padding(.trailing, 10)

                    } else {
                        Button(action: {
                            self.audioPlayer.stopPlayback()
                        }){
                            Image(systemName: "stop.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 80)
                                .padding(.vertical, 20)
                        }
                        .padding(.trailing, 10)
            }
        }
    }
}
