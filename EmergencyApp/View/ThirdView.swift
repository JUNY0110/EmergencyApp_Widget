//
//  MedicalRecorder.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/02.
//

import SwiftUI

//let Recorder = RecorderView(audioRecorder: AudioRecorder())

struct ThirdView: View {
    @ObservedObject var audioRecorder: AudioRecorder

    
    var body: some View {

        VStack{
            RecordingList(audioRecorder: AudioRecorder())
            Recordingbtn(audioRecorder: AudioRecorder())
        }
        .navigationBarItems(trailing: EditButton())
    }
}

//

struct MedicalRecorder_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView(audioRecorder: AudioRecorder())
    }
}
