//
//  ContentView.swift
//  Shopping List
//
//  Created by Tony Hong on 3/11/22.
//

import SwiftUI

class Items: Identifiable {
    let image: String
    let name: String
    let quantity: Int
    
    init(itemImage: String, itemName: String, itemQantity: Int) {
        self.image = itemImage
        self.name = itemName
        self.quantity = itemQantity
    }
}

struct ContentView: View {
    
    var fruitsList = [
        Items(itemImage: "banana", itemName: "Bananas", itemQantity: 3),
    Items(itemImage: "apple", itemName: "Apples", itemQantity: 4),
    Items(itemImage: "eggs", itemName: "Eggs", itemQantity: 12)
    ]
    
    var vebarageList = [
        Items(itemImage: "coke", itemName: "Cokes", itemQantity: 5),
    Items(itemImage: "appleJuice", itemName: "Apple Juice", itemQantity: 3),
    Items(itemImage: "beer", itemName: "Beers", itemQantity: 8)
    ]
    
    var snackList = [
        Items(itemImage: "pocky", itemName: "Pocky", itemQantity: 8),
    Items(itemImage: "gumi", itemName: "Gumi", itemQantity: 16),
    Items(itemImage: "cookie", itemName: "Cookie", itemQantity: 30)
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("fruits")){
                    ForEach(fruitsList) { i in
                        CustomCell(imageName: i.image, itemName: i.name, quantity: i.quantity)
                    }
                }
                
                Section(header: Text("vebarage")) {
                    ForEach(vebarageList) { i in
                        CustomCell(imageName: i.image, itemName: i.name, quantity: i.quantity)
                    }
                }
                
                Section(header: Text("snacks")){
                    ForEach(snackList) { i in
                        CustomCell(imageName: i.image, itemName: i.name, quantity: i.quantity)
                    }
                }
            }.navigationTitle("Shopping List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
