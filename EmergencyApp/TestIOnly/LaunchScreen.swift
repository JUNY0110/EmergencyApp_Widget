//
//  LaunchScreen.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/27.
//

import SwiftUI

struct LaunchScreen: View {
    var body: some View {
        ZStack{
            Color.LaunchRed.edgesIgnoringSafeArea(.all)
            Logo()
        }
    }
}


struct Logo: View {
    
    var body: some View{

        ZStack{
            VStack{

                Spacer()
                
                Image("Heart2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding(.bottom,0)
                    

                Text("ABO")
                    .foregroundColor(.white)
                    .font(.system(size: 120, weight: .black, design: .rounded))
                    .padding(0)
                Text("혼자가 아닌 당신을 위한 기록")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .black, design: .rounded))
                    .padding(.bottom, 120)
                
                Spacer()
                
                Text("Created by Eddy @AppleDeveloper.postech")

            }
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
