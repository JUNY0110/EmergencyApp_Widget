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
    
    var body: some View {

            Button(action: {
                print("dd")
                changeProfileImage = true
                openCameraRoll = true
            }) {
                if changeProfileImage{
                    Image(uiImage: imageSelected)
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                }else{
                    ZStack{
                        Circle()
                            .foregroundColor(.white)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .shadow(color: .gray, radius: 3, x: 2, y: 2)
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.gray)
                            .clipShape(Circle())
                    }
                }

                
            }.sheet(isPresented: $openCameraRoll) {
                ImagePicker(selectedImage: $imageSelected, sourceType: .camera)
            }
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage()
    }
}
