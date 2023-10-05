//
//  SkinaticsWidget.swift
//  SkinaticsWidget
//
//  Created by Nhii on 4/10/2023.
//

import WidgetKit
import SwiftUI


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
        StaticConfiguration(kind: kind, provider: SkinaticsProvider()) { entry in
            SkinaticsWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Skinatics Widget")
        .description("This is a widget to display one skincare product of the day.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct SkinaticsWidget_Previews: PreviewProvider {
    static var previews: some View {
        SkinaticsWidgetEntryView(entry: SkinaticsEntry(date: Date(), productName: "Hyaluronic Acid 2% + B5", productImg: "", productRating: 4.2))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
