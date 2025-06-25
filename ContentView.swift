//
//  ContentView.swift
//  Coinverter
//
//  Created by Svitlana Liuta on 27.05.2025.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State private var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State private var leftAmount = ""
    @State private var rightAmount = ""
    
    @Environment(\.colorScheme) var colorShame
    
    @State var leftCurrency = Currency.sancar
    @State var rightCurrency: Currency = .mala
    
    let currencyTip = CurrencyTip()
    
//    init() {
//        try? Tips.resetDatastore() 
//    }
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 0.8)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.black.opacity(0.3),
                            Color.black.opacity(0.2),
                            Color.black.opacity(0.1)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            VStack {
                // Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(colorShame == .dark ? .black : .white)
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
                        Image(leftCurrency.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70)
                            .shadow(color: .black.opacity(1), radius: 10)
                            .onTapGesture {
                                showSelectCurrency.toggle()
                                currencyTip.invalidate(reason:.actionPerformed)
                            }
                            .popoverTip(currencyTip, arrowEdge: .bottom)
                        // Currency
                        HStack {
                            // Currency text
                            Text(leftCurrency.name)
                                .font(.system(size: 16, weight: .medium))
                                .foregroundStyle(colorShame == .dark ? .black : .white)
                        }
                        .padding(.bottom, -1)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        
                        
                        // Text field
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.center)
                            .cornerRadius(40)
                            .font(.subheadline)
                            .focused($leftTyping)
                            

                    }
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(colorShame == .dark ? .black : .white)
                    
                    // Right conversion section
                    VStack {
                        // Currency image
                        Image(rightCurrency.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70)
                            .shadow(color: .black.opacity(1), radius: 10)
                            .onTapGesture {
                                showSelectCurrency.toggle()
                                currencyTip.invalidate(reason:.actionPerformed)
                            }
                        // Currency
                        HStack {
                            // Currency text
                            Text(rightCurrency.name)
                                .font(.system(size: 16, weight: .medium))
                                .foregroundStyle(colorShame == .dark ? .black : .white)
                        }
                        .padding(.bottom, -1)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        
                        // Text field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.center)
                            .cornerRadius(40)
                            .font(.subheadline)
                            .focused($rightTyping)
                    }
                    
                }
                .padding()
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
                            .foregroundStyle(colorShame == .dark ? .black : .white)
                    }
                    .padding(.trailing)
                    
                    .task {
                        try? Tips.configure()
                    }
                    .onChange(of: leftAmount) {
                        if leftTyping {
                            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                        }
                    }
                    .onChange(of: rightAmount) {
                        if rightTyping {
                            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                        }
                    }
                    .onChange(of: leftCurrency) {
                        leftAmount = ""
                    }
                    .onChange(of: rightCurrency) {
                        rightAmount = ""
                    }
//                    .onChange(of: leftCurrency) {
//                        leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
//                    }
//                    .onChange(of: rightCurrency) {
//                        rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
//                    }
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfo()
                    }
                    .sheet(isPresented: $showSelectCurrency) {
                        SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
                    }
                }
                
            }
//            .border(.blue)
            .padding()
            .keyboardType(.decimalPad)
        }
    }
}

#Preview { //предварительный просмотр
    ContentView()
}
