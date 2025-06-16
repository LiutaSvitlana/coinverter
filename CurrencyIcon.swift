//
//  CurrencyIcon 2.swift
//  Coinverter
//
//  Created by Svitlana Liuta on 14.06.2025.
//
import SwiftUI

struct CurrencyIcon: View {
    let currencyImage: ImageResource
    let currencyName: String
    
    var body: some View {

            //Currency icons
            ZStack(alignment: .bottom) {
                //Currency image
                Image(currencyImage)
                    .resizable()
                    .scaledToFit()
                //Currency text
                Text(currencyName)
                    .padding(3)
                    .font(.caption)
                    .frame(maxWidth: .infinity)
                    .background(.brown.opacity(0.75))
                
            }
            .padding(6)
            .frame(width: 90, height: 90)
            .background(.brown)
            .cornerRadius(50)
            
        }
    }

#Preview{
    CurrencyIcon(currencyImage: .drakr, currencyName: "Darkr")
}
