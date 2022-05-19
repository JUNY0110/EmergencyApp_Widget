////
////  CameraView.swift
////  EmergencyApp
////
////  Created by 지준용 on 2022/04/29.
////
//
////import SwiftUI
////
////struct CameraView: View {
////
////    @ObservedObject var viewModel = CameraViewModel()
////
////    var body: some View {
////        ZStack{
////            viewModel.cameraPreview.ignoresSafeArea()
////                .onAppear{
////                    viewModel.configure()
////                }
////                .gesture(MagnificationGesture()
////                            .onChanged { val in
////                    viewModel.zoom(factor: val)
////                            }
////                            .onEnded { _ in
////                    viewModel.zoomInitialize()
////                            }
////                )
////
////            VStack{
////                CameraTopBtn()
////
////                Spacer()
////
////                CameraBottomBtn()
////            }
////        }
////        .opacity(viewModel.shutterEffect ? 0 : 1)
////    }
////}
////
////struct CameraView_Previews: PreviewProvider {
////    static var previews: some View {
////        CameraView()
////    }
////}
//import SwiftUI
//
//
//struct CameraView: View {
//    @State var shouldShowImagePicker = false
//    @State var showImagePicker = false
//    @State var imageSelected = UIImage()
//    @State var showSheet = false
//    @State var sourceType: UIImagePickerController.SourceType = .camera
//
//    var body: some View {
//        VStack{
//            if let image = self.imageSelected {
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFill()
//                
//            }
//            
//            Spacer()
//            
//            Button(action:{
//                    self.showSheet = true
//            }) {
//                Image(systemName: "camera")
//                    .font(.largeTitle)
//                    .padding()
//                    .clipShape(Circle())
//                
//            }
//            
//            Spacer()
//            
//        }
//        .actionSheet(isPresented: $showSheet) {
//    
//            
//            ActionSheet(title: Text("사진 앨범"), message: Text("선택하세요."), buttons: [
//                .default(Text("사진 선택")){
//                    self.showImagePicker = true
//                    self.sourceType = .photoLibrary
//            },
//                .default(Text("사진 촬영")) {
//                
//                    self.showImagePicker = true
//                    self.sourceType = .camera
//                },
//                    .cancel(Text("취소"))
//
//            ])
//    
//        }
//        .fullScreenCover(isPresented: $showImagePicker) {
//            ImagePicker(selectedImage: $imageSelected, sourceType: self.sourceType)
//        }
//    }
//}
