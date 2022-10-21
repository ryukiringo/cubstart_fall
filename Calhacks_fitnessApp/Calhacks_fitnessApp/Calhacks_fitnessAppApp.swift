//
//  Calhacks_fitnessAppApp.swift
//  Calhacks_fitnessApp
//
//  Created by 柳澤琉貴 on 2022/10/16.
//

import SwiftUI

@main
struct Calhacks_fitnessAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
