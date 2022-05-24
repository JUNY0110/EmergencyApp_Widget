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
        

        List{
            Section(
                header: Text("\(Date(), formatter: PhotoLibraryView.dateformat)")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
            ){
                ForEach(
                    audioRecorder.recordings, id: \.createdAt) {recording in
                    RecordingRow(audioURL: recording.fileURL)
                }
                    .onDelete(perform: delete)
            }
        }
            .listStyle(GroupedListStyle())
            .colorMultiply(.white)
//            .frame(width: 390, height: 550)
        
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
//            .padding(.horizontal)
            .padding(.bottom,10)
        }
    }
    
    
    func delete(at offsets: IndexSet) {
        var urlsToDelete = [URL]()
        for index in offsets {
            urlsToDelete
                .append(audioRecorder.recordings[index].fileURL)
        }
        audioRecorder.deleteRecording(urlsToDelete: urlsToDelete)
    }
    
}



 
struct RecordList_Previews: PreviewProvider {
    static var previews: some View {
        RecordingList(audioRecorder: AudioRecorder())
    }
}
