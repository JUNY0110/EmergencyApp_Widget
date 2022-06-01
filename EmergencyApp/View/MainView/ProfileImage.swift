//
//  ProfileImage.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/27.
//

import SwiftUI

struct ProfileImage: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var dismiss

    @State var changeProfileImage = false
    @State var imageSelected : Data = .init(count: 0)
    @State var showSheet = false
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State var showImagePicker = false

    
    var body: some View {

        ZStack{
            
            if self.imageSelected.count != 0 {
                Button(action: {
                    self.showImagePicker.toggle()
                }) {
                    Image(uiImage: UIImage(data: self.imageSelected)!)
                }
            }

            
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
                            .shadow(color: .gray, radius: 2, x: 1, y: 1)
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.gray)
                            .clipShape(Circle())
                        Image(uiImage: UIImage(data: imageSelected)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                    }
                }
                
                .actionSheet(isPresented: $showSheet) {
                    //수정필요: confirmation dialog
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
