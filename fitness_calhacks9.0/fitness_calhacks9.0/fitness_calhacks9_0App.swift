//
//  fitness_calhacks9_0App.swift
//  fitness_calhacks9.0
//
//  Created by 柳澤琉貴 on 2022/10/15.
//

import SwiftUI

@main
struct fitness_calhacks9_0App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
