//
//  Card.swift
//  BankingApp
//
//  Created by Lee Hojun on 2023/07/25.
//

import SwiftUI

struct Card: Identifiable, Hashable {
  var id: UUID = .init()
  var cardName: String
  var cardColor: Color
  var cardBalance: String
  var isFirstBlankCard: Bool = false
  var expenses: [Expense] = []
}

var sampleCards: [Card] = [
  .init(cardName: "", cardColor: .clear, cardBalance: "", isFirstBlankCard: true),
  .init(cardName: "iJustine", cardColor: Color(.blue), cardBalance: "$1024.9", expenses: [
    Expense(amoundSpent: "$18", prouduct: "Youtube", productIcon: "Youtube", spendType: "Streaming"),
    Expense(amoundSpent: "$128", prouduct: "Amazon", productIcon: "Amazon", spendType: "Groceries"),
    Expense(amoundSpent: "$28", prouduct: "Apple", productIcon: "Apple", spendType: "Apple Pay"),
  ]),
  .init(cardName: "iJustine", cardColor: Color(.red), cardBalance: "$1024.9", expenses: [
    Expense(amoundSpent: "$9", prouduct: "Patreon", productIcon: "Patreon", spendType: "Membership"),
    Expense(amoundSpent: "$10", prouduct: "Dribble", productIcon: "Dribble", spendType: "Membership"),
    Expense(amoundSpent: "$100", prouduct: "Instagram", productIcon: "Instagram", spendType: "Ad Publish"),
  ]),
  .init(cardName: "iJustine", cardColor: Color(.yellow), cardBalance: "$459.78", expenses: [
    Expense(amoundSpent: "$55", prouduct: "Netflix", productIcon: "Netflix", spendType: "Movies"),
    Expense(amoundSpent: "$348", prouduct: "Photoshop", productIcon: "Photoshop", spendType: "Editing"),
    Expense(amoundSpent: "$99", prouduct: "Figma", productIcon: "Figma", spendType: "Pro Member"),
  ])
]
