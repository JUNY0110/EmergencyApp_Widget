//
//  ImagePicker.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/12.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable{
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController{
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        
        return imagePicker
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}


