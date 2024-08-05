//
//  MarketList.swift
//  ListApp
//
//  Created by Merve Sena on 5.08.2024.
//

import SwiftUI

struct MarketList: View {
    let marketExpense1 = Market(date: Date(timeIntervalSince1970: 1672531200), company: "Metro", amount: 80.0)
    let marketExpense2 = Market(date: Date(timeIntervalSince1970: 1675119600), company: "Carrefour", amount: 150.3)
    let marketExpense3 = Market(date: Date(timeIntervalSince1970: 1680390000), company: "Amazon", amount: 450.8)
    let marketExpense4 = Market(date: Date(timeIntervalSince1970: 1685574000), company: "eBay", amount: 345.0)
  
    var markets: [Market] {
        [marketExpense1, marketExpense2, marketExpense3, marketExpense4]
    }
    
    var groupedMarkets: [(String, [Market])] {
        let grouped = Dictionary(grouping: markets) { (market) -> String in
            DateFormatter.yearMonth.string(from: market.date)
        }
        return grouped.sorted { lhs, rhs in
            let lhsDate = DateFormatter.yearMonth.date(from: lhs.key)!
            let rhsDate = DateFormatter.yearMonth.date(from: rhs.key)!
            return lhsDate > rhsDate
        }
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(groupedMarkets, id: \.0) { (monthYear, markets) in
                    Section {
                        ForEach(markets) { market in
                            MarketRow(market: market)
                        }
                    } header: {
                        Text(monthYear)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Market Expenses")
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension DateFormatter {
    static let yearMonth: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }()
    
    static let marketDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter
    }()
}

#Preview {
    NavigationStack {
        MarketList()
    }
}
