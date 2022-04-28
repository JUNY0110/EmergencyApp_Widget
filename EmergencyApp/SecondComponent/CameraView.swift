//
//  CameraView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/29.
//

import SwiftUI

struct CameraView: View {
    var body: some View {

        VStack{
            Spacer()
            
            HStack{
                Spacer()
                
                Rectangle()
                    .frame(width: 50, height: 50)
                Spacer()
                
                Circle()
                    .frame(width: 50, height: 50)
                
                Spacer()
                
                Image(systemName: "arrow.triangle.2.circlepath.camera")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Spacer()
            }
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
