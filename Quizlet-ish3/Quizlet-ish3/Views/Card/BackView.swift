//
//  BackView.swift
//  Quizlet-ish3
//
//  Created by 柳澤琉貴 on 2022/11/10.
//

import Foundation
import SwiftUI

struct BackView: View {
    var backView: some View {
        VStack {
          // 1
          Spacer()
          Text(cardViewModel.card.answer)
            .foregroundColor(.white)
            .font(.body)
            .padding(20.0)
            .multilineTextAlignment(.center)
            .animation(.easeInOut)
          Spacer()
          // 2
          HStack(spacing: 40) {
            Button(action: markCardAsSuccesful) {
              Image(systemName: "hand.thumbsup.fill")
                .padding()
                .background(Color.green)
                .font(.title)
                .foregroundColor(.white)
                .clipShape(Circle())
            }
            Button(action: markCardAsUnsuccesful) {
              Image(systemName: "hand.thumbsdown.fill")
                .padding()
                .background(Color.blue)
                .font(.title)
                .foregroundColor(.white)
                .clipShape(Circle())
            }
          }
          .padding()
        }
        .rotation3DEffect(.degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0))
      }
}
