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

struct SkinaticsWidgetSmallView: View {
    var entry: SkinaticsEntry

    var body: some View {
        ZStack {
            Color("WidgetBackground")
//            VStack() {
//                    Image(entry.productImg)
//                        .resizable()
//                        .aspectRatio(CGSize(width: 5, height: 4), contentMode: .fit)
//                        .clipShape(RoundedRectangle(cornerRadius: 15))
//                    Text(entry.productName)
//                        .padding(10)
//                        .background(Color("Green").opacity(0.8))
//                        .foregroundColor(.white)
//                        .bold()
//                        .cornerRadius(15)
//                        .lineLimit(1)
//                        .padding([.bottom, .horizontal], 5)
//                }
//                .padding(10)
            
            ZStack(alignment: .bottom) {
                    Image(entry.productImg)
                        .resizable()
                        .scaledToFit()
                    Text(entry.productName)
                        .padding(10)
                       .background(Color("Green").opacity(0.8))
                        .foregroundColor(.white)
                        .bold()
                        .cornerRadius(15)
                        .lineLimit(1)
                        .padding([.bottom, .horizontal], 5)
                }
        }
        }
}

struct SkinaticsWidgetMediumView: View {
    var entry: SkinaticsEntry

    var body: some View {
        ZStack {
            Color("WidgetBackground")
            
            VStack() {
                Text("Today's Product")
                HStack() {
                    Image(entry.productImg)
                        .resizable()
                        .aspectRatio(CGSize(width: 5, height: 4), contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 15))

                    VStack(alignment: .leading, spacing: 10) {
                        Text(entry.productName)
                            .bold()
                            .foregroundColor(Color("Green"))
                        HStack {
                            Text("\(entry.productRating.formatted())")
                            Image(systemName: "star.fill")
                        }
                    }
                    .padding(.leading, 10)
                }
            }
            .padding(.horizontal, 2)
            .padding(.vertical, 10)
        }
        }
}

struct SkinaticsWidgetLargeView: View {
    var entry: SkinaticsEntry

    var body: some View {
        ZStack {
            Color("WidgetBackground")
            VStack() {
                ZStack(alignment: .bottom) {
                    Image(entry.productImg)
                        .resizable()

                    Text(entry.productName)
                        .padding(10)
                        .background(Color("Green").opacity(0.8))
                        .foregroundColor(.white)
                        .bold()
                        .cornerRadius(10)
                        .lineLimit(1)

                    HStack {
                        Text("\(entry.productRating.formatted())")
                        Image(systemName: "star.fill")
                    }
                }
            }
            .padding(.top, 5)
        }
        }
}


struct SkinaticsWidgetEntryView : View {
    var entry: SkinaticsEntry

    @Environment(\.widgetFamily) var widgetFamily: WidgetFamily
    @ViewBuilder
    var body: some View {
        switch widgetFamily {
                case .systemSmall:
                    SkinaticsWidgetSmallView(entry: entry)
                case .systemMedium:
                    SkinaticsWidgetMediumView(entry: entry)
                case .systemLarge:
                    SkinaticsWidgetLargeView(entry: entry)
                default:
                    EmptyView()
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
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct SkinaticsWidget_Previews: PreviewProvider {
    static var previews: some View {
        SkinaticsWidgetEntryView(entry: SkinaticsEntry(date: Date(), productName: "Hyaluronic Acid 2% + B5", productImg: "the-ordinary-hyaluronic-acid-style", productRating: 4.2))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
