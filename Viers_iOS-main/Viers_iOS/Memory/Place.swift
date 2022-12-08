//
//  Place.swift
//  Viers_iOS
//
//  Created by Kun  on 07/12/22.
//

import Foundation
import SwiftUI

class Place: Identifiable, ObservableObject {
    let id: UUID
    @Published var content: String
    @Published var crowd: String
    let insertDate: Date
    
    init(content: String, crowd: String, insertDate: Date = Date.now) {
        id = UUID()
        self.content = content
        self.crowd = crowd
        self.insertDate = insertDate
    }
}
