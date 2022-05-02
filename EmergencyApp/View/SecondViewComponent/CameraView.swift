//
//  CameraView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/29.
//

import SwiftUI

struct CameraView: View {

    @ObservedObject var viewModel = CameraViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

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

                HStack{
                    Spacer()

                    Button(action: {
                        viewModel.switchSilent()
                    }) {
                        Image(systemName: viewModel.isSilentModeOn ? "speaker.fill" : "speaker")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor( viewModel.isSilentModeOn ? .yellow : .white)
                            .frame(width: 20, height: 20)
                    }

                    Spacer()

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

                Spacer()

                HStack{

                    Button(action: {}){
                        if let previewImage = viewModel.recentImage {
                            Image(uiImage: previewImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .aspectRatio(1, contentMode: .fit)
                        } else {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 3)
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                    
                        }
                    }

                    Spacer()

                    Button(action: {
                        viewModel.capturePhoto()
                    }) {

                        Circle()
                            .stroke(lineWidth: 3)
                            .frame(width: 50, height: 50)
                        
                    }
                    

                    Spacer()
                    Button(action: {
                        viewModel.changeCamera()
                    }) {

                        Image(systemName: "arrow.triangle.2.circlepath.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                    }


                }
                .foregroundColor(.white)
                .padding(10)
                .background(.black)
                .opacity(0.7)
            }
        }
        .opacity(viewModel.shutterEffect ? 0 : 1)

//                .navigationTitle("")
//                .navigationBarHidden(true)
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
