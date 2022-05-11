//
//  CameraBottomBtn.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/07.
//

import SwiftUI

struct CameraBottomBtn: View {
    @ObservedObject var viewModel = CameraViewModel()
    
    
    var body: some View {
        HStack{
            Button(action: {}){
                if let previewImage = viewModel.recentImage {
                    Image(uiImage: previewImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .aspectRatio(1, contentMode: .fit)
                } else {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                }
            }
            Spacer()

            Button(action: {
                print("어쩌꼬")
                viewModel.capturePhoto()
                
            }) {
                Circle()
                    .stroke(lineWidth: 3)
                    .frame(width: 50, height: 50)
            }
            Spacer()
            
            Button(action: {
                viewModel.changeCamera()
            }) {

                Image(systemName: "arrow.triangle.2.circlepath.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
            }
        }
        .foregroundColor(.white)
        .padding(10)
        .background(.black)
        .opacity(0.7)
    }
}

struct CameraBottomBtn_Previews: PreviewProvider {
    static var previews: some View {
        CameraBottomBtn()
    }
}
