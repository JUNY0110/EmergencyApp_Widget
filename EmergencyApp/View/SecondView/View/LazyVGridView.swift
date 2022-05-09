//
//  LazyVGridView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/29.
//

import SwiftUI

struct LazyVGridView: View {
    
    
    static let dateformat: DateFormatter = {
          let formatter = DateFormatter()
           formatter.dateFormat = "YYYY년 MM월 dd일"
           return formatter
       }()
    
    var today = Date()
    
    let columns = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    var body: some View {
            
        VStack {
                
            LazyVGrid(columns: columns, alignment: .center, spacing: nil, pinnedViews: [], content: {
                Section(header: Text("\(today, formatter: LazyVGridView.dateformat)")
                    .font(.title2)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                )
                {
                    ForEach(medicineRecordData, id: \.self){
                    medical in
                    Image(medical.image)
                        .resizable()
                        .frame(width: 170, height: 150)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                        .scaledToFill()
                    }
                }
            })
            Divider()
        }
        
    }
}

struct LazyVGridView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridView()
    }
}
