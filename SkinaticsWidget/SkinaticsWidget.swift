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
        SkinaticsEntry(date: Date(), productName: "", productImg: "", productRating: 0.0)
    }

    // provide data for widget render
    func getSnapshot(in context: Context, completion: @escaping (SkinaticsEntry) -> ()) {
        if let userDefaults = UserDefaults(suiteName: "group.com.FaceCare.Skinatics") {
            if let name = userDefaults.string(forKey: "productName"), let img = userDefaults.string(forKey: "productImg") {
                let entry = SkinaticsEntry(date: Date(), productName: name, productImg: img, productRating: userDefaults.double(forKey: "productRating"))
                completion(entry)
            }
        }
    }

    // array for current & future times for widget update
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SkinaticsEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            if let userDefaults = UserDefaults(suiteName: "group.com.FaceCare.Skinatics") {
                if let name = userDefaults.string(forKey: "productName"), let img = userDefaults.string(forKey: "productImg") {
                    let entry = SkinaticsEntry(date: entryDate, productName: name, productImg: img, productRating: userDefaults.double(forKey: "productRating"))
                    entries.append(entry)
                }
            }
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SkinaticsEntry: TimelineEntry {
    let date: Date
    let productName: String
    let productImg: String
    let productRating: Double
}

struct SkinaticsWidgetEntryView : View {
    var entry: SkinaticsEntry

    var body: some View {
        ZStack {
            Color("WidgetBackground")
            Text(entry.productName)
        }
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
        SkinaticsWidgetEntryView(entry: SkinaticsEntry(date: Date(), productName: "Product", productImg: "", productRating: 4.0))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
