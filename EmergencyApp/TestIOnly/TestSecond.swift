//
//  TestSecond.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/05.
//

import SwiftUI

struct TestSecond: View {
    
    @AppStorage("emoji", store: UserDefaults(suiteName: "group.Eddy.EmergencyApp"))
    
    var emojiData: Data = Data()
    
    let emojis = [
        Emoji(icon: "😀", name: "Happy", description: "행복해"),
        Emoji(icon: "🥲", name: "Sad", description: "슬퍼"),
        Emoji(icon: "😡", name: "Heated", description: "화났어")
    ]

    var body: some View {
        VStack{
            ForEach(emojis){ emoji in
                TestThird(emoji: emoji)
                    .onTapGesture {
                        save(emoji)
                    }
                
            }
        }
    }
    func save(_ emoji: Emoji) {
        guard let emojiData = try? JSONEncoder().encode(emoji) else {return}
        self.emojiData = emojiData
        print("save: \(emoji)")
     
        
    }
}

struct TestSecond_Previews: PreviewProvider {
    static var previews: some View {
        TestSecond()
    }
}
