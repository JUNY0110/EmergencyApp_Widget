//
//  SecondView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/26.
//

import UIKit
import SwiftUI

struct SecondView: View {

//    @State private var isShowPhotoLibrary = false
//    @State private var image = UIImage()
    @State private var showModal = false

    
    var body: some View {

//        NavigationView{
        VStack{
                
            
            ScrollView(.vertical, showsIndicators: false, content: {
                LazyVGridView()
            })
            .frame(width: .infinity, height: 550)
//            .frame(width: .infinity, height: 600)
            
            
            Button(action: {
                    self.showModal = true

            }) {
                HStack{
                    Image(systemName: "camera.fill")
                    Text("사진촬영")
                        .font(.system(size: 20, weight: .regular))
                }
                .frame(width: 350, height: 40)
                .background(Color.LaunchRed)
                .foregroundColor(.white)
                .cornerRadius(20)
                .padding(.bottom,10)
            }
            .fullScreenCover(isPresented: self.$showModal) {
                CameraView()
            }
            

//            }
//            .frame(width: .infinity, height: 600)
        }
    }
}




//struct ImagePicker: UIViewControllerRepresentable {
//
//
//    var sourceType: UIImagePickerController.SourceType = .photoLibrary
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
//
//        let imagePicker = UIImagePickerController()
//        imagePicker.allowsEditing = false
//        imagePicker.sourceType = sourceType
//
//        return imagePicker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
//    }
//}


struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
