//
//  Card.swift
//  Quizlet-ish3
//
//  Created by 柳澤琉貴 on 2022/11/10.
//

import Foundation
import FirebaseFirestoreSwift

struct Card: Identifiable, Codable {
  @DocumentID var id: String?
  var question: String
  var answer: String
  var successful: Bool = true
  var userId: String?
}
