//
//  ProfileImage.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/27.
//

import SwiftUI

struct ProfileImage: View {
    var body: some View {
        Image("Profile")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .frame(width: 150, height: 150)
            .shadow(color: .gray, radius: 5, x: 3, y: 3)
        
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage()
    }
}
