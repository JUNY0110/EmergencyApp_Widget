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
            
        ScrollView{
            
            LazyVGrid(columns: columns, alignment: .center, spacing: nil, pinnedViews: [], content: {
                
                Section(header: Text("\(today, formatter: LazyVGridView.dateformat)")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.LaunchRed)
                )
                
                
                {
                    ForEach(medicineRecordData, id: \.self){
                    medical in
                    Image(medical.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(5)
                        .padding(.horizontal, 10)
                
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
