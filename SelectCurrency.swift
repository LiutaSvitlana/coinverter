//
//  SelectCurrency.swift
//  Coinverter
//
//  Created by Svitlana Liuta on 14.06.2025.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @State var topCurrency: Currency
    @State var bottomCurrency: Currency
    
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
                
                IconGrid(currency: topCurrency)
                .padding()
                
                //Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top)
                    
                //Currency icons
                IconGrid(currency: bottomCurrency)
                    .padding()
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
            .foregroundStyle(.black)
        }
    }
}

#Preview{
    SelectCurrency(topCurrency: .drakr, bottomCurrency: .gibber)
}
