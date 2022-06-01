//
//  SwiftUIView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/26.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var textFieldName: String = "이름을 입력하세요."
    
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.backward")
                Text("뒤로 가기")
            }
            .foregroundColor(.blue)
        }
    }
    
    var body: some View {
        
        NavigationView{
            VStack {
                ScrollView(.vertical, showsIndicators: false, content: {
                    
                    ProfileImage()
                    
                    PersonalInfo(textFieldName: $textFieldName)
                    
                    EmergencyContact()

                    MedicalRecord()
                    
                })
            }
            .navigationBarTitle(Text("기본 정보"), displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        addItem()
                    }){
                        Text("저장")
                    }
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    private func addItem() {
        withAnimation {
            let newName = PersonalInfoEntity(context: viewContext)
            newName.name = ""

            textFieldName = ""
            
            saveItems()
        }
    }
    
    private func saveItems() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


//struct를 인스턴스로 변경하고, func으로 struct 내의 TextField에 반영하려면?
//Binding은 State와 연결되어있다는 의미이고, 하나를 변경하면 다른 뷰에서 영향을 주지만, 저장이 되지는 않기때문에, CoreData나 UserDefault를 통해 저장해줘야 함.
