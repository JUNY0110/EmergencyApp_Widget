////
////  CameraListRoew.swift
////  EmergencyApp
////
////  Created by 지준용 on 2022/05/17.
////
//
//import SwiftUI
//
//struct CameraListRow: View {
//
//    @ObservedObject var savephoto: Camera
//
//    var body: some View {
//        HStack{
//
//            Spacer()
//
//            if audioPlayer.isPlaying == false {
//                Button(action: {
//                    self.audioPlayer.startPlayback(audio: self.audioURL)
//                }){
//                    Image(systemName: "play.circle")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 100, height: 80)
//                        .padding(.vertical, 20)
//                }
//                .padding(.trailing, 10)
//
//            } else {
//                Button(action: {
//                    self.audioPlayer.stopPlayback()
//                }){
//                    Image(systemName: "stop.circle")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 100, height: 80)
//                        .padding(.vertical, 20)
//                }
//                .padding(.trailing, 10)
//    }
//}
//    }
//}
//
//struct CameraListRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CameraListRow()
//    }
//}
