//
//  AudioRecorder.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/02.
//

import SwiftUI

import Foundation
import SwiftUI
import Combine
import AVFoundation


class AudioRecorder: ObservableObject {
    
    let objectWillChange = PassthroughSubject<AudioRecorder, Never>()
    let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let audioFilename = documentPath.appendingPathComponent("\(Date().toString(dateFormat: "dd-MM-YY_'at'_HH:mm:ss")).m4a")
    
    
    var audioRecorder: AVAudioRecorder!
    
    var recording = false {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    func startRecording(){
        let recordingSession = AVAudioSession.sharedInstance()
    }
    
    do{
        try recordingSession.setCategory(.playAndRecord, mode: .default)
        try recordingSession.setActive(true)
    } catch {
        print("Failed to set up recording session")
    }
    
}

extension Date{
    func toString(dateFormat format: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
