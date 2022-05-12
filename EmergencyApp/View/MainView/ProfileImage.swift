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
            }) {

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
//                Image("Profile")
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .clipShape(Circle())
//            .frame(width: 150, height: 150)
//            .shadow(color: .gray, radius: 5, x: 3, y: 3)
        
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage()
    }
}
