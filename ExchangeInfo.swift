//
//  ExchangeInfo.swift
//  Coinverter
//
//  Created by Svitlana Liuta on 11.06.2025.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack {
            // Background image
            Image(.background6)
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
                // Title text
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                
                // Description text
                Text("Welcome, traveler.\nIn your adventures across Tamriel, you've found more than just gold — coins from forgotten ages, relics of lost civilizations. Most see them as trinkets. But you know better.\nThis converter helps reveal their true value. From the icy Falmer Mallari to the ancient Nord Drakr, and the refined Sancar of the Thalmor — each coin has worth beyond its age. Use it wisely. Not all treasure glitters, but every coin tells a story.\nBelow is a simple guide to our coin exchange rates:")
                    .font(.system(size: 16))
                    .padding()
                
                // Exchange rates
                ExchangeRate(leftImage: .drakr, text: "1 Drakr = 2 Mala", rightImage: .mala)
                
                ExchangeRate(leftImage: .mala, text: "1 Mala = 4 Nchuark", rightImage: .nchuark)
                
                ExchangeRate(leftImage: .nchuark, text: "1 Nchuark = 2 Gibber", rightImage: .gibber)
                
                ExchangeRate(leftImage: .gibber, text: "1 Gibber = 5 Sancar", rightImage: .sancar)
                
                ExchangeRate(leftImage: .sancar, text: "1 Sancar = 2 Mallari", rightImage: .mallari)
                
                ExchangeRate(leftImage: .mallari, text: "1 Mallari = 3 Drakr", rightImage: .drakr)

                // Button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.title2)
                .padding()
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}

