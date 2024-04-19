//
//  Currency.swift
//  LOTRConverter17
//
//  Created by Shreyas Sahoo on 26/03/24.
//
import SwiftUI
enum Currency : Double, CaseIterable ,Identifiable{
    var id: Currency{
        self
    }
    
    case goldPiece = 1
    case goldPenny = 4
    case silverPiece = 16
    case silverPenny = 64
    case copperPenny = 6400
    
    var image : ImageResource {
        switch self {
        case .goldPiece :
                .goldpiece
        case .goldPenny :
                .goldpenny
        case .silverPiece :
                .silverpiece
        case .silverPenny :
                .silverpenny
        case .copperPenny :
                .copperpenny
        }
    }
    var name : String {
        switch self {
        case .goldPiece:
            "Gold Piece"
        case .goldPenny:
            "Gold Penny"
        case .silverPiece:
            "Silver Piece"
        case .silverPenny:
            "Silver Penny"
        case .copperPenny:
            "Copper Penny"
        }
    }
    
    func convert (amountString : String, currency : Currency ) -> String{
        guard let doubleAmount = Double(amountString) else {
            return ""
        }
        let convertedAmount = (doubleAmount / self.rawValue ) * currency.rawValue
        return String(format: "%.2f", convertedAmount)
    }
}

