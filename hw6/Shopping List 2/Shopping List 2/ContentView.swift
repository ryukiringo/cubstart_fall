//
//  ContentView.swift
//  Shopping List 2
//
//  Created by Tony Hong on 3/27/22.
//

import SwiftUI

class Items: Identifiable {
    
    var itemName: String
    
    var quantity: String
    
    init(itemName: String, quantity: String) {
        
        self.itemName = itemName
        
        self.quantity = quantity
    }
    
}


struct ContentView: View {
    @State var tempItemName: String = ""
    
    @State var tempItemQuantity: String = ""
    @State private var isShowingAlert: Bool = false
    @State var list = [
        Items(itemName: "Bananas", quantity: "3"),
        Items(itemName: "Apples", quantity: "4"),
        Items(itemName: "Eggs", quantity: "12")
    ]
    
    func addItem() {
        if tempItemName == "" || tempItemQuantity == "" {
            isShowingAlert = true
        } else {
            list.append(Items(itemName: tempItemName, quantity: tempItemQuantity))
            tempItemName = ""
            tempItemQuantity = ""
        }
    }
    
    func deleteList(at offsets: IndexSet) {
        list.remove(atOffsets: offsets)
    }
        
    var body: some View {
        NavigationView {
            List {
                ForEach(list) { listItems in
                    CustomCell(itemName: listItems.itemName, quantity: listItems.quantity)
                }
                .onDelete(perform: deleteList)
                
                HStack {
                    TextField("Item Name", text: $tempItemName)
                    
                    Spacer()
                    
                    TextField("Item quantity", text: $tempItemQuantity)
                }
                Button("Add New Item") {
                    addItem()
                }
                .alert("Blank is not Approved", isPresented: $isShowingAlert) {
                    Button("OK", role: .cancel) {
                        isShowingAlert = false
                    }
                }
                Button("Remove the Last one") {
                    list.removeLast()
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
