//
//  PlaceStore.swift
//  Viers_iOS
//
//  Created by Kun  on 07/12/22.
//

import Foundation

class PlaceStore: ObservableObject {
    @Published var list: [Place]
    
    init() {
        list = [
            Place(content: "Moffitt library", crowd: "2", insertDate: Date.now),
            Place(content: "RSF", crowd: "4", insertDate: Date.now.addingTimeInterval(60 * -2)),
            Place(content: "Doe Library", crowd: "7", insertDate: Date.now.addingTimeInterval(60 * -5)),
            Place(content: "MLK Building", crowd: "5", insertDate: Date.now.addingTimeInterval(60 * -3))
        ]
    }
                  
    func insert(place: String, people: String) {
        list.insert(Place(content: place, crowd: people), at: 0)
    }
                  
    func update(place: Place?, content: String, people: String) {
        guard let place = place else {
            return
        }
        place.content = content
        place.crowd = people
    }
      
    func delete(place : Place) {
        list.removeAll { $0.id == place.id }
    }
      
    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index)
        }
    }
}
