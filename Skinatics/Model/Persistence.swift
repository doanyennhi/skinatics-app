//
//  Persistence.swift
//  Skinatics
//
//  Created by Nhii on 6/10/2023.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    // Core Data's storage
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (desc, err) in
            if let error = err as NSError? {
                print("Error: \(error), \(error.userInfo)")
            }
        })
    }
    
    static var preview: PersistenceController = {
        let res = PersistenceController(inMemory: true)
        let viewContext = res.container.viewContext
        
        // TODO: set up model data file, try saving preview data
        do {
            try viewContext.save()
        } catch {
            let nsErr = error as NSError
            print("Error: \(nsErr), \(nsErr.userInfo)")
        }
        return res
    }()
}
