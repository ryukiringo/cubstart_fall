//
//  Calhacks9_0_2App.swift
//  Calhacks9.0_2
//
//  Created by 柳澤琉貴 on 2022/10/16.
//

import SwiftUI

@main
struct Calhacks9_0_2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
