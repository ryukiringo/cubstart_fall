//
//  PlaceCell.swift
//  Viers_iOS
//
//  Created by Kun  on 07/12/22.
//

import SwiftUI

struct PlaceCell: View {
    @ObservedObject var place: Place
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text(place.content)
                    .font(.largeTitle)
                    .lineLimit(1)
                Spacer()
                Text("\(String(Int(place.crowd)!*10))%")
                    .font(.largeTitle)
//                    .foregroundColor(.secondary)
                    .padding()
                
                
            }
            Text(place.insertDate, style: .time)
                .font(.caption)
                .foregroundColor(.secondary)
            
        }
        .background(Color.gray)
        .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.gray, lineWidth: 10)
            )
    }
}

struct PlaceCell_Previews: PreviewProvider {
    static var previews: some View {
        PlaceCell(place : Place(content: "Test", crowd: "0"))
    }
}
