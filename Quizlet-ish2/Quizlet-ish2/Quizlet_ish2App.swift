//
//  Quizlet_ish2App.swift
//  Quizlet-ish2
//
//  Created by 柳澤琉貴 on 2022/11/10.
//

import SwiftUI
import Firebase

@main
struct Quizlet_ish2App: App {
    init() {
            FirebaseApp.configure()
          }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
