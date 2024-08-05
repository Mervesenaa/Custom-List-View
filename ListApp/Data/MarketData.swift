//
//  MarketData.swift
//  ListApp
//
//  Created by Merve Sena on 5.08.2024.
//

import Foundation

struct Market: Identifiable {
    let id: UUID
    let date: Date
    let company: String
    let amount: Double
    
    init(id: UUID = UUID(), date: Date, company: String, amount: Double) {
        self.id = id
        self.date = date
        self.company = company
        self.amount = amount
    }
}
