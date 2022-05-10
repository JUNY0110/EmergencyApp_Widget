//
//  CameraTopBtn.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/07.
//

import SwiftUI

struct CameraTopBtn: View {
    @ObservedObject var viewModel = CameraViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack{
            Spacer()

//            Button(action: {
//                viewModel.switchSilent()
//            }) {
//                Image(systemName: viewModel.isSilentModeOn ? "speaker.fill" : "speaker")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .foregroundColor( viewModel.isSilentModeOn ? .yellow : .white)
//                    .frame(width: 20, height: 20)
//            }
//
//            Spacer()

            Button(action: {
                viewModel.switchFlash()
            }) {
                Image(systemName: viewModel.isFlashOn ? "bolt.fill" : "bolt")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(viewModel.isFlashOn ? .yellow : .white)
                    .frame(width: 20, height: 20)
            }

            Spacer()
            
            Button(action: {
               self.presentationMode.wrappedValue.dismiss()
            }) {
              Text("끄기")
                    .foregroundColor(.red)
                    .font(.system(size: 20, weight: .black))
            }
            Spacer()

        }
        .padding(.vertical, 10)
        .background(.black)
        .opacity(0.7)
        
    }
}

struct CameraTopBtn_Previews: PreviewProvider {
    static var previews: some View {
        CameraTopBtn()
    }
}
