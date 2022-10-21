//
//  rolldiceApp.swift
//  rolldice
//
//  Created by 柳澤琉貴 on 2022/10/13.
//

import SwiftUI

@main
struct rolldiceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
