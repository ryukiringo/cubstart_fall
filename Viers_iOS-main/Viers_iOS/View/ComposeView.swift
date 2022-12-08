//
//  ComposeView.swift
//  Viers_iOS
//
//  Created by Kun  on 07/12/22.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store: PlaceStore
    
    var place: Place? = nil
    
    @Environment(\.dismiss) var dismiss
    
    @State private var content: String = ""
    @State private var crowd: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $content)
                    .padding()
                    .onAppear {
                        if let place = place {
                            content = place.content
                        }
                    }
            
                TextEditor(text: $crowd)
                    .padding()
                    .onAppear {
                        if let place = place {
                            crowd = place.crowd
                        }
                    }
            }
            .navigationTitle(place != nil ? "Update Place" : "New Place")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        if let place = place {
                            store.update(place: place, content: content, people: crowd)
                        } else {
                            store.insert(place: content, people: crowd)
                        }
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            .environmentObject(PlaceStore())
    }
}
