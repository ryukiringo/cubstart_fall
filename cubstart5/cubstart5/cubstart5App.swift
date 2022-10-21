//
//  cubstart5App.swift
//  cubstart5
//
//  Created by 柳澤琉貴 on 2022/10/20.
//

import SwiftUI

@main
struct cubstart5App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
