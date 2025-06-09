//
//  ContentView.swift
//  Coinverter
//
//  Created by Svitlana Liuta on 27.05.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showExchangeInfo = false
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Image(.khajiit)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(50)
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 3, y: 55)
                
                // Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .fontWeight(.medium)
                
                // Conversion section
                HStack {
                    // Left conversion section
                    VStack {
                        // Currency
                        HStack {
                            // Currency image
                            Image(.ancientNordDrakr)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 33)
                            
                            // Currency text
                            Text("Ancient Nord")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        
                        // Text field
                        Text("Text field")
                    }
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                    
                    // Right conversion section
                    VStack {
                        // Currency
                        HStack {
                            // Currency text
                            Text("Ayleid Mala")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // Currency image
                            Image(.ayleidMala)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 33)
                        }
                        
                        // Text field
                        Text("Text field")
                    }
                }
                
                Spacer()
                    
                // Info button
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
                
            }
            .border(.blue)

        }
        
    }
}

#Preview { //предварительный просмотр
    ContentView()
}
