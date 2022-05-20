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
    
    @State private var inputImage: UIImage?
    @State private var image: Image?
    
//    @State var image: UIImage?
    
//    @ObservedObject var audioRecorder: AudioRecorder

    
//    @ObservedObject var medical: MedicineRecordData
    let pills = MedicineRecordData.all()
    
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

        //columns갯수를 정하기 위한 설정
        let medicinePills = pills.pills(into: 2)
//        let selectedImage =
        VStack{
     
//        List {

            ScrollView{
                Section(
                    header: Text("\(Date(), formatter: PhotoLibraryView.dateformat)")
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                ){
                ForEach(0..<medicinePills.count) { columns in
                    HStack{
                        ForEach(medicinePills[columns]) { row in

                            //imageSelected 사용하면 될듯?? imagePicker를 활용해보자.
                            Image(row.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 170, height: 170)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                        }

                        }
                    }
                }
            }
            
            Button(action:{
                self.showSheet = true
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
            .actionSheet(isPresented: $showSheet) {


                ActionSheet(title: Text("사진 앨범"), message: Text("선택하세요."), buttons: [

                    .default(Text("사진 선택")){
                        self.showImagePicker = true
                        self.sourceType = .photoLibrary
                },
                    .default(Text("사진 촬영")) {

                        self.showImagePicker = true
                        self.sourceType = .camera
                    },
                        .cancel(Text("취소"))

                ])
                
            }
//            .onChange(of: inputImage) { _ in loadImage()}
            .fullScreenCover(isPresented: $showImagePicker) {
                ImagePicker(selectedImage: $imageSelected, sourceType: self.sourceType)
            }
 
        }
    }
//    func loadImage() {
//        guard let inputImage = inputImage else {
//            return
//        }
//        image = Image(uiImage: inputImage)
//
//    }
//
//    func save() {
//
//    }
}

extension URL {
    func loadImage(_ image: inout UIImage?) {
        if let data = try? Data(contentsOf: self), let loaded = UIImage(data: data) {
            image = loaded
        } else {
            image = nil
        }
    }
    func saveImage(_ image: UIImage?) {
        if let image = image {
            if let data = image.jpegData(compressionQuality: 1.0) {
                try? data.write(to: self)
            }
        } else {
            try? FileManager.default.removeItem(at: self)
        }
    }
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
//
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


        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoLibraryView()
    }
}
