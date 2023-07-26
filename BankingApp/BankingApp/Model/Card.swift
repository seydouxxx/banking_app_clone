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
  .init(cardName: "Seydoux", cardColor: Color(.blue), cardBalance: "$1024.9", expenses: [
    Expense(amoundSpent: "$18", prouduct: "Youtube", productIcon: "tv.fill", spendType: "Streaming"),
    Expense(amoundSpent: "$128", prouduct: "Amazon", productIcon: "carrot.fill", spendType: "Groceries"),
    Expense(amoundSpent: "$28", prouduct: "Apple", productIcon: "apple.logo", spendType: "Apple Pay"),
  ]),
  .init(cardName: "Seydoux", cardColor: Color(.red), cardBalance: "$1024.9", expenses: [
    Expense(amoundSpent: "$9", prouduct: "Patreon", productIcon: "dollarsign.circle.fill", spendType: "Membership"),
    Expense(amoundSpent: "$10", prouduct: "Dribble", productIcon: "dollarsign.circle.fill", spendType: "Membership"),
    Expense(amoundSpent: "$100", prouduct: "Instagram", productIcon: "laptopcomputer", spendType: "Ad Publish"),
  ]),
  .init(cardName: "Seydoux", cardColor: Color(.yellow), cardBalance: "$459.78", expenses: [
    Expense(amoundSpent: "$55", prouduct: "Netflix", productIcon: "tv.fill", spendType: "Movies"),
    Expense(amoundSpent: "$348", prouduct: "Photoshop", productIcon: "laptopcomputer", spendType: "Editing"),
    Expense(amoundSpent: "$99", prouduct: "Figma", productIcon: "laptopcomputer", spendType: "Pro Member"),
  ])
]
