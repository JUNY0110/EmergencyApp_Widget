//
//  TestThird.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/05.
//

import SwiftUI

struct TestThird: View {

    let emoji: Emoji
    
    var body: some View {
      
        Text(emoji.icon)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(Circle())
    }
}
//
//struct TestThird_Previews: PreviewProvider {
//    static var previews: some View {
//        TestThird(emoji: emoji)
//    }
//}
