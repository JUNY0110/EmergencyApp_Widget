//
//  Sound.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/03.
//
//
//import SwiftUI
//import AVKit
//
//class SoundSetting: ObservableObject{
//    
//    static let instance = SoundSetting()
//    
//    var player: AVAudioPlayer?
//    
//    
//    //함수 안에서 초기화를 왜 하지?
//    func playSound() {
//        guard let url = URL(string: "") else {return}
//        do {
//            player = try? AVAudioPlayer(contentsOf: url)
//            player?.play()
//        } catch let error {
//            print("재생에 오류가 발생했습니다. \(error.localizedDescription)")
//        }
//    }
//}
//
//struct SoundEffectView: View {
//    var soundSetting = SoundSetting()
//    var body: some View{
//        Text("어쩌구 저쩌구")
//        
//    }
//}
