//
//  SecondView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/26.
//

import UIKit
import SwiftUI

struct SecondView: View {

    @State private var showModal = false
    
    var body: some View {

        VStack{
                
            
            ScrollView(.vertical, showsIndicators: false, content: {
                LazyVGridView()
            })
            .frame(width: .infinity, height: 550)
            
            
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
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
