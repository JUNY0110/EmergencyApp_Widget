////
////  LazyVGridView.swift
////  EmergencyApp
////
////  Created by 지준용 on 2022/04/29.
////
//
//import SwiftUI
//
//struct LazyVGridView: View {
//    
////    @ObservedObject var audioRecorder: AudioRecorder
//
//    @ObservedObject var savephoto: Camera
//    
//    static let dateformat: DateFormatter = {
//          let formatter = DateFormatter()
//           formatter.dateFormat = "YYYY년 MM월 dd일"
//           return formatter
//       }()
//    
//    var today = Date()
//    
//    let columns = [
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil)
//    ]
//    
//    var body: some View {
//       
//        Text("")
//        
//        ForEach(medicineRecordData.indices, id:\.self) { _ in
//            HStack{
//                ForEach(0..<2) {_ in
//                    Rectangle()
//                    
//                }
//            }
////            HStack{
////                ForEach(0..<6) {_ in
////
////                }
////            }
//            
//        }
//        
//        
//        
////        List{
////            Section(
////                header: Text("\(Date(), formatter: LazyVGridView.dateformat)")
////                    .font(.system(size: 25, weight: .bold, design: .rounded))
////            ){
////                ForEach(medicineRecordData, id: \.self){  // 기존의 데이터를 가져오지 않고, 사진을 찍으면 옮겨오는 방식..이 되어야함.
////                medical in
////                Image(medical.image)
////                    .resizable()
////                    .frame(width: 170, height: 150)
////                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
////                    .scaledToFill()
////                }
////            }
////            ForEach(
////                audioRecorder.recordings, id: \.createdAt) {recording in
////                RecordingRow(audioURL: recording.fileURL)
////            }
////        }
//            .listStyle(GroupedListStyle())
//            .colorMultiply(.white)
//            .frame(width: 390, height: 550)
//    }
//}
////        VStack {
////
////            LazyVGrid(columns: columns, alignment: .center, spacing: nil, pinnedViews: [], content: {
////                Section(header: Text("\(today, formatter: LazyVGridView.dateformat)")
////                    .font(.title2)
////                    .foregroundColor(.black)
////                    .frame(maxWidth: .infinity)
////                )
////                {
////                    ForEach(medicineRecordData, id: \.self){
////                    medical in
////                    Image(medical.image)
////                        .resizable()
////                        .frame(width: 170, height: 150)
////                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
////                        .scaledToFill()
////                    }
////                }
////            })
////            Divider()
////        }
////
////    }
////}
//
////struct LazyVGridView_Previews: PreviewProvider {
////    static var previews: some View {
////        LazyVGridView()
////    }
////}
