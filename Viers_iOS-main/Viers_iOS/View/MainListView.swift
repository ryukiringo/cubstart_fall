//
//  MainListView.swift
//  Viers_iOS
//
//  Created by Kun on 07/12/22.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store: PlaceStore
    
    @State private var showComposer: Bool = false
    init() {
        UINavigationBar.appearance().backgroundColor = .blue
        // 背景色
            UINavigationBar.appearance().titleTextAttributes = [ .foregroundColor: UIColor.white] // タイトル色
            UINavigationBar.appearance().tintColor = .gray // backボタン色
        }
    
    var body: some View {
        VStack{
            NavigationView{
                List {
                    ForEach(store.list) { place in
                        ZStack{
                            NavigationLink {
                                DetailView(place: place)
                            } label: {
                                PlaceCell(place: place)
                            }
                            EmptyView()
                        }
//                        .opacity(0)
                        .listRowSeparator(.hidden)
                    }
                    .onDelete(perform: store.delete)
                }
                .listStyle(.plain)
                
                .navigationTitle("Viers")
                
                .toolbar {
                    Button {
                        showComposer = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $showComposer) {
                    ComposeView()
                }
                .navigationBarTitleDisplayMode(.inline)
                
            }
            Image("bearpicture")
                .resizable()
                .resizable()
                .scaledToFit()
                .frame(width: .infinity)
        }
        
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(PlaceStore())
    }
}
