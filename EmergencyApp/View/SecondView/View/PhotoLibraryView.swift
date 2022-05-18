//
//  PhotoLibraryView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/16.
//

import SwiftUI


struct PhotoLibraryView: View {
    @State private var showModal = false
    @State var shouldShowImagePicker = false
    @State var showImagePicker = false
    @State var imageSelected = UIImage()
    @State var showSheet = false
    @State var sourceType: UIImagePickerController.SourceType = .camera
//    @State var image: UIImage?
    
//    @ObservedObject var audioRecorder: AudioRecorder

    
//    @ObservedObject var medical: MedicineRecordData
    let pills = medicineRecordData.pills(into: 2)
    
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

        
        
        
//        List{
            //medicineRecordData의 데이터갯수만큼 인덱스를 넣어주고,
//            ForEach(0..<4) { medical in
//                HStack{
                    // 내부 Foreach에 Column갯수로 사용할
                    ForEach(0..<pills.count) { columns in
                        HStack{
                            ForEach(pills[columns]) { row in
                            
                                Image(row.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
//                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                                
                            }
                            
                        }
                    }
//                }
//            }
//        }
    }
        
//        List{
//            
//            
//            ForEach(0..< Data.MedicineRecordData/4){ row in
//                HStack{
//                    ForEach(0..<2){
//                        // 기존의 데이터를 가져오지 않고, 사진을 찍으면 옮겨오는 방식..이 되어야함.
//                        // 사진촬영 기능에 대한 struct 또는 func을 넣어야함.
//                        columns in
//                        Image(medical.image)
//                        .resizable()
////                        .frame(width: 170, height: 150)
////                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
//                        .scaledToFill()
//                    }
//                }
//            }
//        }
//    }
}
            
            
            
//
//
//
//
//
//
//            ScrollView(.vertical, showsIndicators: false, content: {
//                List{
//                    Section(
//                        header: Text("\(Date(), formatter: LazyVGridView.dateformat)")
//                            .font(.system(size: 25, weight: .bold, design: .rounded))
//                    ){
//                        ForEach(medicineRecordData, id: \.self){  // 기존의 데이터를 가져오지 않고, 사진을 찍으면 옮겨오는 방식..이 되어야함.
//
//                            // 사진촬영 기능에 대한 struct 또는 func을 넣어야함.
//
//                        medical in
//                        Image(medical.image)
//                            .resizable()
//                            .frame(width: 170, height: 150)
//                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
//                            .scaledToFill()
//                        }
//                    }
//                }
//            })
//            Divider()
//
//            Button(action:{
//                self.showSheet = true
//            }) {
//                HStack{
//                    Image(systemName: "camera.fill")
//                    Text("사진촬영")
//                        .font(.system(size: 20, weight: .regular))
//                }
//                .frame(width: 350, height: 40)
//                .background(Color.LaunchRed)
//                .foregroundColor(.white)
//                .cornerRadius(20)
//                .padding(.bottom,10)
//
//            }
//
//            Spacer()
//
//        }
//        .actionSheet(isPresented: $showSheet) {
//
//
//            ActionSheet(title: Text("사진 앨범"), message: Text("선택하세요."), buttons: [
//                .default(Text("사진 선택")){
//                    self.showImagePicker = true
//                    self.sourceType = .photoLibrary
//            },
//                .default(Text("사진 촬영")) {
//
//                    self.showImagePicker = true
//                    self.sourceType = .camera
//                },
//                    .cancel(Text("취소"))
//
//            ])
//
//        }
//        .fullScreenCover(isPresented: $showImagePicker) {
//            ImagePicker(selectedImage: $imageSelected, sourceType: self.sourceType)
//        }
//    }
//}
        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoLibraryView()
    }
}
