//
//  DetailView.swift
//  Viers_iOS
//
//  Created by Kun  on 07/12/22.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var place: Place
    
    @EnvironmentObject var store: PlaceStore
    
    @State private var showComposer = false
    @State private var showDeleteAlert = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(place.content)
                            .padding()
                        
                        Spacer(minLength: 0)
                        
                        Text("Crowd Level : \(place.crowd)")
                            .padding()
                            .foregroundColor(.secondary)
                    }
                    
                    Text(place.insertDate, style: .time)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("Place Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigation) {
                Button {
                    showDeleteAlert = true
                } label : {
                    Image(systemName: "trash")
                }
                .foregroundColor(.red)
                .alert("Confirm Delete", isPresented: $showDeleteAlert) {
                    Button(role: .destructive) {
                        store.delete(place: place)
                        dismiss()
                    } label: {
                        Text("Delete")
                    }
                } message: {
                    Text("Delete this place?")
                }
                
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .sheet(isPresented: $showComposer) {
            ComposeView(place: place)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(place: Place(content: "Test", crowd: "0"))
                .environmentObject(PlaceStore())
        }
    }
}
