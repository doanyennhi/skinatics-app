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
        SkinaticsEntry(date: Date(), productName: "", productImg: "", productRating: 0.0, productDesc: "")
    }
    
    // provide data for widget render
    func getSnapshot(in context: Context, completion: @escaping (SkinaticsEntry) -> ()) {
        if let userDefaults = UserDefaults(suiteName: "group.com.FaceCare.Skinatics") {
            if let name = userDefaults.string(forKey: "productName"), let img = userDefaults.string(forKey: "productImg"), let desc = userDefaults.string(forKey: "productDesc") {
                let entry = SkinaticsEntry(date: Date(), productName: name, productImg: img, productRating: userDefaults.double(forKey: "productRating"), productDesc: desc)
                completion(entry)
            }
        }
    }
    
    // array for current & future times for widget update
    func getTimeline(in context: Context, completion: @escaping (Timeline<SkinaticsEntry>) -> ()) {
        var entry: SkinaticsEntry = SkinaticsEntry(date: Date(), productName: "", productImg: "", productRating: 0.0, productDesc: "")
        
        // Generate a timeline where widget updates every midnight
        let currentDate = Date()
        let start = Calendar.current.startOfDay(for: currentDate)
        let end = Calendar.current.date(byAdding: .day, value: 1, to: start)!
        
        if let userDefaults = UserDefaults(suiteName: "group.com.FaceCare.Skinatics") {
            if let name = userDefaults.string(forKey: "productName"), let img = userDefaults.string(forKey: "productImg"), let desc = userDefaults.string(forKey: "productDesc") {
                entry = SkinaticsEntry(date: start, productName: name, productImg: img, productRating: userDefaults.double(forKey: "productRating"), productDesc: desc)
            }
        }
        
        let timeline = Timeline(entries: [entry], policy: .after(end))
        completion(timeline)
    }
}
