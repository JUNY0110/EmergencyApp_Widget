//
//  AudioPlayer.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/04.
//

import SwiftUI
import Foundation
import Combine
import AVFoundation


class AudioPlayer: NSObject,ObservableObject, AVAudioPlayerDelegate {
    let objectWillChange = PassthroughSubject<AudioPlayer, Never>()
    var isPlaying = false{
        didSet {
            objectWillChange.send(self)
        }
    }
    var audioPlayer: AVAudioPlayer!
    
    func startPlayback(audio: URL) {
        let playbackSession = AVAudioSession.sharedInstance()
        
        do{
            try playbackSession.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
            
        } catch {
            print("playing over the device's speakers failed")
        }
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audio)
            audioPlayer.delegate = self
            audioPlayer.play()
            isPlaying = true
        } catch {
            print("PlayBack Failed")
        }
    }
    func stopPlayback() {
        audioPlayer.stop()
        isPlaying = false
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag{
            isPlaying = false
        }
    }
    
}
