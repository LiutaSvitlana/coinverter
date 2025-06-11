//
//  ContentView.swift
//  Coinverter
//
//  Created by Svitlana Liuta on 27.05.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showExchangeInfo = false
    @State private var leftAmount = ""
    @State private var rightAmount = ""
    
    var body: some View {
        ZStack {
            Image(.background2)
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 0.8)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.black.opacity(0.3),
                            Color.black.opacity(0.5),
                            Color.black.opacity(0)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            VStack {

                
                // Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .fontWeight(.medium)
                
                Image(.khajiit)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(50)
                    .shadow(color: .black.opacity(0.3), radius: 30, x: 3, y: 30)
                    .padding(10)
                // Conversion section
                HStack {
                    // Left conversion section
                    VStack {
                        // Currency image
                        Image(.drakr)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70)
                            .shadow(color: .black.opacity(1), radius: 10)
                        // Currency
                        HStack {
                            // Currency text
                            Text("Drakr")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -1)
                        
                        // Text field
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.center)
                            .cornerRadius(40)
                            .font(.subheadline)
                    }
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                    
                    // Right conversion section
                    VStack {
                        // Currency image
                        Image(.mala)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70)
                            .shadow(color: .black.opacity(1), radius: 10)
                        // Currency
                        HStack {
                            // Currency text
                            Text("Mala")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -1)
                        
                        // Text field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.center)
                            .cornerRadius(40)
                            .font(.subheadline)
                    }
                    
                }
                .padding()
//                .background(.black.opacity(0.5))
                .cornerRadius(30)
                
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
//            .border(.blue)
            .padding()

        }
        
    }
}

#Preview { //предварительный просмотр
    ContentView()
}
