//
//  lecture8App.swift
//  lecture8
//
//  Created by 柳澤琉貴 on 2022/11/03.
//

import SwiftUI

@main
struct lecture8App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
