//
//  EmergencyWidget.swift
//  EmergencyWidget
//
//  Created by 지준용 on 2022/04/26.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct EmergencyWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack{
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 400, height: 200)
                .padding(.leading)
            HStack{
                Text("A+")
                    .foregroundColor(.white)
                    .font(.system(size: 60, weight: .black, design: .rounded))
                    .padding()
                VStack{
                    Text("엄마: 010-1234-5678")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .black, design: .rounded))
                        .padding(.trailing)
                    Text("친구: 010-5678-1234")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .black, design: .rounded))
                        .padding(.trailing)
                        .padding(.top, 10)

                    
                }
            }
        }
    }
}

@main
struct EmergencyWidget: Widget {
    let kind: String = "EmergencyWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            EmergencyWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("정보 보여주기")
        .description("위젯을 통해 당신에 대한 기본 정보를 제공할 수 있어요.")
    }
}

struct EmergencyWidget_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

//import WidgetKit
//import SwiftUI
//
//struct EmojiEntry: TimelineEntry {
//    let date =  Date()
//    let emoji: Emoji
//
//}

//
//
//struct Provider2: TimelineProvider {
//    typealias Entry = <#type#>
//
//    @AppStorage("emoji", store: UserDefaults(suiteName: "group.Eddy.EmergencyApp"))
//    var emojiData: Data = Data()
//
//}

//struct Provider: TimelineProvider {
//    func placeholder(in context: Context) -> EmojiEntry {
//        guard let emoji = try? JSONDecoder().decode(Emoji.self, from: emojiData) else { return }
//        let entry = EmojiEntry(emoji: emoji)
//        completion(timeline)
//    }
//
//
//
//    @AppStorage("emoji", store: UserDefaults(suiteName: "group.Eddy.EmergencyApp"))
//    var emojiData: Data = Data()
//
//    func getSnapshot(in context: Context, completion: @escaping (EmojiEntry) -> ()) {
//        guard let emoji = try? JSONDecoder().decode(Emoji.self, from: emojiData) else { return }
//        let entry = EmojiEntry(emoji: emoji)
//        completion(entry)
//    }
//
//    func getTimeline(in context: Context, completion: @escaping (Timeline<EmojiEntry>) -> ()) {
//        guard let emoji = try? JSONDecoder().decode(Emoji.self, from: emojiData) else { return }
//        let entry = EmojiEntry(emoji: emoji)
//        let timeline = Timeline(entries: [entry], policy: .never)
//        completion(timeline)
//    }
    
//
//
//    typealias Entry = EmojiEntry
//
//    @AppStorage("emoji", store: UserDefaults(suiteName: "group.Eddy.EmergencyApp"))
//    var emojiData: Data = Data()
//
//    func snapshot(with context: Context, completion: @escaping (EmojiEntry) ->()) {
//        guard let emoji = try? JSONDecoder().decode(Emoji.self, from: emojiData) else { return }
//        let entry = EmojiEntry(emoji: emoji)
//        completion(entry)
//    }
//    func timeline(with context: Context, completion: @escaping (Timeline<EmojiEntry>) -> ()){
//        guard let emoji = try? JSONDecoder().decode(Emoji.self, from: emojiData) else { return }
//        let entry = EmojiEntry(emoji: emoji)
//        let timeline = Timeline(entries: [entry], policy: .never)
//        completion(timeline)
//    }
//
//}
//
//struct PlaceholderView: View {
//    var body: some View{
//        TestThird(
//            emoji: Emoji(icon: "😀", name: "N/A", description: "N/A")
//        )
//    }
//}

//struct WidgetEntryView: View {
//    let entry: Provider.Entry
//
//    @Environment(\.widgetFamily) var family
//
//    @ViewBuilder
//    var body: some View {
//        switch family {
//        case . systemSmall:
//            TestThird(emoji: entry.emoji)
//        case .systemMedium:
//            HStack{
//                TestThird(emoji: entry.emoji)
//
//                Text(entry.emoji.name)
//                    .font(.largeTitle)
//            }
//
//        default:
//            VStack{
//                HStack{
//                    TestThird(emoji: entry.emoji)
//
//                    Text(entry.emoji.name)
//                        .font(.largeTitle)
//                }
//                Text(entry.emoji.description)
//                    .font(.title2)
//            }
//        }
//
//
//
//    }
//}
//
//@main
//
//struct MyWidget: Widget{
//
//    private let kind = "My_Widget"
//
//    var body: some WidgetConfiguration {
//        StaticConfiguration(
//            kind: kind,
//            provider: Provider(),
//            placeholder: PlaceholderView()
//        ) { entry in
//            WidgetEntryView(entry: entry)
//        }
//        .supportedFamilies([.systemMedium])
//    }
//}
//




//
//struct Provider: IntentTimelineProvider {
//    func placeholder(in context: Context) -> SimpleEntry {
//        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
//    }
//
//    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
//        let entry = SimpleEntry(date: Date(), configuration: configuration)
//        completion(entry)
//    }
//
//    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
//        var entries: [SimpleEntry] = []
//
//        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
//        let currentDate = Date()
//        for hourOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//            let entry = SimpleEntry(date: entryDate, configuration: configuration)
//            entries.append(entry)
//        }
//
//        let timeline = Timeline(entries: entries, policy: .atEnd)
//        completion(timeline)
//    }
//}
//
//struct SimpleEntry: TimelineEntry {
//    let date: Date
//    let configuration: ConfigurationIntent
//}
//
//struct EmergencyWidgetEntryView : View {
//    var entry: Provider.Entry
//
//    var body: some View {
//        ZStack{
//            Image("Background")
//
//            Text(entry.date, style: .time)
//                .foregroundColor(.white)
//                .font(.system(size: 20, weight: .black, design: .rounded))
//        }
//    }
//}
//
//@main
//struct EmergencyWidget: Widget {
//    let kind: String = "EmergencyWidget"
//
//    var body: some WidgetConfiguration {
//        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
//            EmergencyWidgetEntryView(entry: entry)
//        }
//        .configurationDisplayName("정보 보여주기")
//        .description("위젯을 통해 당신에 대한 기본 정보를 제공할 수 있어요.")
//    }
//}
//
//struct EmergencyWidget_Previews: PreviewProvider {
//    static var previews: some View {
//        EmergencyWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
//            .previewContext(WidgetPreviewContext(family: .systemSmall))
//    }
//}
