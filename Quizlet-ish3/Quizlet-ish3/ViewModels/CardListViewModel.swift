//
//  CardListViewModel.swift
//  Quizlet-ish3
//
//  Created by 柳澤琉貴 on 2022/11/10.
//

import Foundation
import Combine

class CardListViewModel: ObservableObject {

  @Published var cardViewModels: [CardViewModel] = []

  private var cancellables: Set<AnyCancellable> = []


  @Published var cardRepository = CardRepository()

  init() {

    cardRepository.$cards.map { cards in
      cards.map(CardViewModel.init)
    }

    .assign(to: \.cardViewModels, on: self)

    .store(in: &cancellables)
  }


  func add(_ card: Card) {
    cardRepository.add(card)
  }
}
