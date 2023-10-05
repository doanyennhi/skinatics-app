//
//  SkinaticsProvider.swift
//  SkinaticsWidgetExtension
//
//  Created by Nhii on 5/10/2023.
//

import WidgetKit

struct SkinaticsProvider: TimelineProvider {
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
    func getTimeline(in context: Context, completion: @escaping (Timeline<SkinaticsEntry>) -> ()) {
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
