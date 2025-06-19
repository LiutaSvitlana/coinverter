//
//  IconGrid.swift
//  Coinverter
//
//  Created by Svitlana Liuta on 19.06.2025.
//

import SwiftUI

struct IconGrid: View {
    @State var currency: Currency
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { currency in
                if self.currency == currency {
                    CurrencyIcon(currencyImage: currency.image,
                                 currencyName: currency.name)
                    .shadow(color: .brown, radius: 7)
                    .overlay {
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(lineWidth: 2)
                            .opacity(0.5)
                    }
                } else {
                    CurrencyIcon(currencyImage: currency.image,
                                 currencyName: currency.name)
                    .onTapGesture {
                        self.currency = currency
                    }
                }
            }
        }
    }
}

#Preview{
    IconGrid(currency: .drakr)
}
