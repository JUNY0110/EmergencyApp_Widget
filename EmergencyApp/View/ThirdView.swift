//
//  MedicalRecorder.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/02.
//

import SwiftUI


struct ThirdView: View {

    
    var body: some View {

        VStack{
            RecordingList(audioRecorder: AudioRecorder())
        }
    }
}

//

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
