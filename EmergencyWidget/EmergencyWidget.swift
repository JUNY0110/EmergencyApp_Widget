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
