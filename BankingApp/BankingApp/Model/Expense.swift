//
//  Expense.swift
//  BankingApp
//
//  Created by Lee Hojun on 2023/07/25.
//

import SwiftUI

struct Expense: Identifiable, Hashable, Equatable {
  var id = UUID().uuidString
  var amoundSpent: String
  var prouduct: String
  var productIcon: String
  var spendType: String
}
