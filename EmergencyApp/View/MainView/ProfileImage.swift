//
//  ProfileImage.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/27.
//

import SwiftUI

struct ProfileImage: View {
    
    @State var changeProfileImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    @State var showSheet = false
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State var showImagePicker = false

    
    var body: some View {

        ZStack{
            
            Button(action: {
                    
                    self.showSheet = true
                    changeProfileImage = true
                    
                }) {
                    ZStack{
                        Circle()
                            .foregroundColor(.white)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.gray)
                            .frame(width: 120, height: 120)
                            .shadow(color: .gray, radius: 3, x: 2, y: 2)
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.gray)
                            .clipShape(Circle())
                        Image(uiImage: imageSelected)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                    }
                }
                .actionSheet(isPresented: $showSheet) {
                    //confirmation dialog
            
                    
                    ActionSheet(title: Text("사진 앨범"), message: Text("선택하세요."), buttons: [
                        .default(Text("사진 선택")){
                            self.showImagePicker = true
                            self.sourceType = .photoLibrary
                    },
                        .default(Text("사진 촬영")) {
                        
                            self.showImagePicker = true
                            self.sourceType = .camera
                        },
                            .cancel(Text("취소"))

                    ])
            
                }
                .fullScreenCover(isPresented: $showImagePicker) {
                    ImagePicker(selectedImage: $imageSelected, sourceType: self.sourceType)
                }
        }
    }
}


struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage()
    }
}
