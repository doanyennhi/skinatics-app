//
//  SkinaticsApp.swift
//  Skinatics
//
//  Created by Nhii on 14/8/2023.
//

import SwiftUI

@main
struct SkinaticsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
