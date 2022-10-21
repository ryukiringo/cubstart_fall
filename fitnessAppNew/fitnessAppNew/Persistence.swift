//
//  Persistence.swift
//  fitnessAppNew
//
//  Created by 柳澤琉貴 on 2022/10/16.
//

import CoreData
 
struct PersistenceController {
    static let shared = PersistenceController()
    
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "fitnessAppNew")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
