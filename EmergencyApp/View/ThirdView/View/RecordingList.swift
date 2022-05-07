//
//  RecordList.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/02.
//

import SwiftUI

struct RecordingList: View {
    var soundSetting = AudioRecorder()
    
    @ObservedObject var audioRecorder: AudioRecorder
    
//    let columns = [
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil)
//    ]
    @State private var users = ["포뇨", "소스케", "서근"]

    var body: some View {
        
        
        List{
            ForEach(audioRecorder.recordings, id: \.createAt) {recording in
                RecordingRow(audioURL: recording.fileURL)
            }.onDelete(perform: delete)
//                .onMove(perform: moveList)
        }.listStyle(GroupedListStyle())
//
//        ScrollView(.vertical, showsIndicators: false, content: {
//            LazyVGrid(columns: columns, alignment: .center, spacing: nil, pinnedViews: [], content: {
//
//                ForEach(audioRecorder.recordings, id: \.createAt) {recording in
//                    RecordingRow(audioURL: recording.fileURL)
//                }
//            })
//        }).frame(width: .infinity, height: 550)
    }
    
    func delete(at offsets: IndexSet) {
        var urlsToDelete = [URL]()
        for index in offsets {
            urlsToDelete.append(audioRecorder.recordings[index].fileURL)
            }
        audioRecorder.deleteRecording(urlsToDelete: urlsToDelete)
        }
    
    
//    func delete(at offsets: IndexSet) {
//
//        var urlsToDelete = [URL]()
//        for index in offsets {
//            urlsToDelete.append(audioRecorder.recordings[index].fileURL)
//        }
//        audioRecorder.deleteRecording(urlsToDelete: urlsToDelete)
//    }
//
    
    
    
//    func removeList(at offsets: IndexSet) {
//        print(offsets)
//        audioRecorder.recordings.remove(atOffsets: offsets)
//    }
//    func moveList(from source: IndexSet, to destination: Int) {
//        audioRecorder.recordings.move(fromOffsets: source, toOffset: destination)
//    }
}

 
struct RecordList_Previews: PreviewProvider {
    static var previews: some View {
        RecordingList(audioRecorder: AudioRecorder())
    }
}

//
//struct Delete: ViewModifier {
//
//    let action: () -> Void
//
//    @State var offset: CGSize = .zero
//    @State var initialOffset: CGSize = .zero
//    @State var contentWidth: CGFloat = 0.0
//    @State var willDeleteIfReleased = false
//
//    func body(content: Content) -> some View {
//        content
//            .background(
//                GeometryReader { geometry in
//                    ZStack {
//                        Rectangle()
//                            .foregroundColor(.red)
//                        Image(systemName: "trash")
//                            .foregroundColor(.white)
//                            .font(.title2.bold())
//                            .layoutPriority(-1)
//                    }.frame(width: -offset.width)
//                    .offset(x: geometry.size.width)
//                    .onAppear {
//                        contentWidth = geometry.size.width
//                    }
//                    .gesture(
//                        TapGesture()
//                            .onEnded {
//                                delete()
//                            }
//                    )
//                }
//            )
//            .offset(x: offset.width, y: 0)
//            .gesture (
//                DragGesture()
//                    .onChanged { gesture in
//                        if gesture.translation.width + initialOffset.width <= 0 {
//                            self.offset.width = gesture.translation.width + initialOffset.width
//                        }
//                        if self.offset.width < -deletionDistance && !willDeleteIfReleased {
//                            hapticFeedback()
//                            willDeleteIfReleased.toggle()
//                        } else if offset.width > -deletionDistance && willDeleteIfReleased {
//                            hapticFeedback()
//                            willDeleteIfReleased.toggle()
//                        }
//                    }
//                    .onEnded { _ in
//                        if offset.width < -deletionDistance {
//                            delete()
//                        } else if offset.width < -halfDeletionDistance {
//                            offset.width = -tappableDeletionWidth
//                            initialOffset.width = -tappableDeletionWidth
//                        } else {
//                            offset = .zero
//                            initialOffset = .zero
//                        }
//                    }
//            )
//            .animation(.interactiveSpring())
//    }
//
//    private func delete() {
//        offset.width = -contentWidth
//        action()
//    }
//
//    private func hapticFeedback() {
//        let generator = UIImpactFeedbackGenerator(style: .medium)
//        generator.impactOccurred()
//    }
//
//    //MARK: Constants
//
//    let deletionDistance = CGFloat(200)
//    let halfDeletionDistance = CGFloat(50)
//    let tappableDeletionWidth = CGFloat(100)
//
//
//}
//
//extension View {
//
//    func onDelete(perform action: @escaping () -> Void) -> some View {
//        self.modifier(Delete(action: action))
//    }
//
//}
