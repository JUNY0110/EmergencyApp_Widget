//
//  RecordList.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/02.
//

import SwiftUI

struct RecordingList: View {
    var soundSetting = AudioRecorder()
    
    @ObservedObject var audioRecorder: AudioRecorder
    
    
    let columns = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    var body: some View {    
        
        ScrollView(.vertical, showsIndicators: false, content: {
            LazyVGrid(columns: columns, alignment: .center, spacing: nil, pinnedViews: [], content: {
                    
                ForEach(audioRecorder.recordings, id: \.createAt) {recording in
                    RecordingRow(audioURL: recording.fileURL)
                }
            })
        }).frame(width: .infinity, height: 550)
    }
}

 
struct RecordList_Previews: PreviewProvider {
    static var previews: some View {
        RecordingList(audioRecorder: AudioRecorder())
    }
}
