//
//  SecondView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/26.
//

import UIKit
import SwiftUI

struct SecondView: View {

    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()

    
    var body: some View {

        
        
        VStack{
            
            ScrollView{
                

                LazyVGridView()


                Button(action: {
                    self.isShowPhotoLibrary = true
                }) {
                    HStack{
                        Image(systemName: "photo")
                        Text("사진찍기")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                }
            }
            .sheet(isPresented: $isShowPhotoLibrary) {
                ImagePicker(sourceType: .photoLibrary)
                    
            }
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {

    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {

        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType

        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }

}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
