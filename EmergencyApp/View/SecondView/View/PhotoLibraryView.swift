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

        VStack{
                
            
            ScrollView(.vertical, showsIndicators: false, content: {
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
                                
                                if let image = self.imageSelected {
                                    Image(uiImage: image)
                                        .resizable()
                                        .frame(width: 170, height: 150)
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                                        .scaledToFill()
                                    
                                }
                            }
                            
                        }
                        
                        
                    })
                    Divider()
                }
                
            })
            .frame(width: .infinity, height: 550)
            
            
            Button(action:{
//                didTapButton()
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

            Spacer()

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
        .fullScreenCover(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: $imageSelected, sourceType: self.sourceType)
        }
        
//        func didTapButton() {
//            if let image = self.imageSelected {
//                upload(image)
//            } else {
//                shouldShowImagePicker.toggle()
//            }
//        }
//
//        func upload(_ image: UIImage) {
//            guard let imageData = image.jpegData(compressionQuality: 8.5) else {return}
//            let key = UUID().uuidString + ".jpg"
//        }
        
    }
}
        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoLibraryView()
    }
}
