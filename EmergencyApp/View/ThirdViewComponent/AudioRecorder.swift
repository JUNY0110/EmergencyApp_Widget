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



class AudioRecorder: NSObject, ObservableObject {

    let objectWillChange = PassthroughSubject<AudioRecorder, Never>()
    var audioRecorder: AVAudioRecorder!
    
    var recordings = [RecordingData]()
    
    var recording = false {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    func startRecording() {
        let recordingSession = AVAudioSession.sharedInstance()
        
        do{
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        } catch {
            print("Failed to set up recording session")
        }
        
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let audioFilename = documentPath.appendingPathComponent("\(Date().toString(dateFormat: "dd-MM-YY_'at'_HH:mm:ss")).m4a")
//        return recordingSession
        let settings = [
                  AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                  AVSampleRateKey: 12000,
                  AVNumberOfChannelsKey: 1,
                  AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
              ]
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.record()
            recording = true
        } catch {
            print("Could not start recording")
        }
    }
    
    func stopRecording() {
        audioRecorder.stop()
        recording = false
        
        fetchRecording()
        }
    
    func fetchRecording() {
        recordings.removeAll()
        
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let directoryContents = try! fileManager.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)

        for audio in directoryContents{
            let recording = RecordingData(fileURL: audio, createAt: getCreationDate(for: audio))
            recordings.append(recording)
            recordings.sort(by: {$0.createAt.compare($1.createAt) == .orderedAscending})
            objectWillChange.send(self)
        }
    }
    
    override init() {
        super.init()
        fetchRecording()
    }
}
//}
    
    func getCreationDate(for file: URL) -> Date {
        if let attributes = try? FileManager.default.attributesOfItem(atPath: file.path) as [FileAttributeKey: Any],
        
            let creationDate = attributes[FileAttributeKey.creationDate] as? Date{
            return creationDate
        } else {
            return Date()
        }
    }
//}

extension Date{
    func toString(dateFormat format: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
