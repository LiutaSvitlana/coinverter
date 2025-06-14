//
//  SelectCurrency.swift
//  Coinverter
//
//  Created by Svitlana Liuta on 14.06.2025.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack {
            //Background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.white.opacity(0.2),
                            Color.white.opacity(0.3),
                            Color.white.opacity(0.2)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            VStack {
                //Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                //Currency icons
                CurrencyIcon(currencyImage: .drakr, currencyName: "Darkr")
                
                
                //Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    
                //Currency icons
                
                //Button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.title2)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview{
    SelectCurrency()
}
