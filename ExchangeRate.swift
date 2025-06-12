//
//  ExchangeRate.swift
//  Coinverter
//
//  Created by Svitlana Liuta on 12.06.2025.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let text: String
    let rightImage: ImageResource
    
    var body: some View {
        
        HStack {
            // Left image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 40)
            // Exchange text
            Text(text)
            // Right image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 40)
        }
    }
}

#Preview{
    ExchangeRate(leftImage: .drakr, text: "1 Drakr = 2 Mala", rightImage: .mala)
}
