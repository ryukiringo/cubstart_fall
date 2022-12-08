//
//  Quizlet_ish3App.swift
//  Quizlet-ish3
//
//  Created by 柳澤琉貴 on 2022/11/10.
//

import SwiftUI
import Firebase

@main
struct Quizlet_ish3App: App {
    init() {
            FirebaseApp.configure()
          }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
