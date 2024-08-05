//
//  MarketRow.swift
//  ListApp
//
//  Created by Merve Sena on 5.08.2024.
//

import SwiftUI

struct MarketRow: View {
    var market: Market
    
    var body: some View {
        HStack(spacing: 20) {
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.green.opacity(0.3))
                    .frame(width: 44, height: 44)
                
                Image(systemName: "basket.fill")
                    .foregroundStyle(.green)
                    .font(.system(size: 20))
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(market.company)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                Text(market.date, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Text("$\(market.amount, specifier: "%.2f")")
                .font(.subheadline)
                .bold()
                .foregroundStyle(.primary)
        }
        .padding([.top, .bottom], 8)
    }
}

let sampleMarket = Market(date: Date(), company: "Tusco", amount: 120.9)

#Preview {
    MarketRow(market: sampleMarket)
}
