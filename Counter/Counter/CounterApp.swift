//
//  CounterApp.swift
//  Counter
//
//  Created by 柳澤琉貴 on 2022/09/29.
//

import SwiftUI

@main
struct CounterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
