//
//  Currency.swift
//  Coinverter
//
//  Created by Svitlana Liuta on 16.06.2025.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    case mallari = 128
    case drakr = 16
    case mala = 8
    case nchuark = 4
    case gibber = 2
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
    
    func convert(amountString: String, currency: Currency) -> String { 
        guard let doubleAmount = Double(amountString) else {
            return ""
        }
        
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        
        return String(format: "%.2f", convertedAmount)
    }
}
