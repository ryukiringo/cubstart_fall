//
//  SwiftUI_BullseyeAppApp.swift
//  SwiftUI_BullseyeApp
//
//  Created by 柳澤琉貴 on 2022/10/07.
//

import SwiftUI

@main
struct SwiftUI_BullseyeAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
