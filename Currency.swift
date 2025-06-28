//
//  Currency.swift
//  Coinverter
//
//  Created by Svitlana Liuta on 16.06.2025.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    case mallari = 1280
    case drakr = 640
    case mala = 64
    case nchuark = 16
    case gibber = 4
    case sancar = 1
    
    var id: Currency { self }
    
    var image: ImageResource {
        switch self {
        case .mallari:
                .mallari
        case .drakr:
                .drakr
        case .mala:
                .mala
        case .nchuark:
                .nchuark
        case .gibber:
                .gibber
        case .sancar:
                .sancar
        }
    }
    
    var name: String {
        switch self {
        case .mallari:
                "Mallari"
        case .drakr:
                "Drakr"
        case .mala:
                "Mala"
        case .nchuark:
                "Nchuark"
        case .gibber:
                "Gibber"
        case .sancar:
                "Sancar"
        }
    }
    
    func convert(_ amountString: String, to currency: Currency) -> String { 
        guard let doubleAmount = Double(amountString) else {
            return ""
        }
        
        let convertedAmount = doubleAmount * (self.rawValue / currency.rawValue)
        
        return String(format: "%.2f", convertedAmount)
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
