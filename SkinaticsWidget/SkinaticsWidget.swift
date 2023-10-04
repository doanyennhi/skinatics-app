//
//  SkinaticsWidget.swift
//  SkinaticsWidget
//
//  Created by Nhii on 4/10/2023.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    // placeholder widget view while getting data
    func placeholder(in context: Context) -> SkinaticsEntry {
        SkinaticsEntry(date: Date(), providerInfo: "Product")
    }

    // provide data for widget render
    func getSnapshot(in context: Context, completion: @escaping (SkinaticsEntry) -> ()) {
        let entry = SkinaticsEntry(date: Date(), providerInfo: "snapshot")
        completion(entry)
    }

    // array for current & future times for widget update
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SkinaticsEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SkinaticsEntry(date: entryDate, providerInfo: "timeline")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SkinaticsEntry: TimelineEntry {
    let date: Date
    let providerInfo: String
}

struct SkinaticsWidgetEntryView : View {
    var entry: SkinaticsEntry

    var body: some View {
        VStack {
            Text(entry.providerInfo)
        }
        .background(Color("Floral White"))
    }
}

struct SkinaticsWidget: Widget {
    let kind: String = "SkinaticsWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            SkinaticsWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Skinatics Widget")
        .description("This is a widget to display one skincare product of the day.")
    }
}

struct SkinaticsWidget_Previews: PreviewProvider {
    static var previews: some View {
        SkinaticsWidgetEntryView(entry: SkinaticsEntry(date: Date(), providerInfo: "preview"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
