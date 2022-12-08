//
//  ContentView.swift
//  Viers_iOS
//
//  Created by 柳澤琉貴 on 2022/12/07.
//

import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
                    MainListView()
                        .tabItem {
                        Label("Main", systemImage: "house.fill")
                    }
                    
                    Text("た")
                        .tabItem {
                            Label("Profile", systemImage: "person.crop.circle.fill")
                    }
                }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

