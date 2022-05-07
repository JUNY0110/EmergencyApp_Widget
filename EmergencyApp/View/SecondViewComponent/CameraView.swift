//
//  CameraView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/29.
//

import SwiftUI

struct CameraView: View {

    @ObservedObject var viewModel = CameraViewModel()

    var body: some View {
        ZStack{
            viewModel.cameraPreview.ignoresSafeArea()
                .onAppear{
                    viewModel.configure()
                }
                .gesture(MagnificationGesture()
                            .onChanged { val in
                    viewModel.zoom(factor: val)
                            }
                            .onEnded { _ in
                    viewModel.zoomInitialize()
                            }
                )
            
            VStack{
                CameraTopBtn()

                Spacer()

                CameraBottomBtn()
            }
        }
        .opacity(viewModel.shutterEffect ? 0 : 1)
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
