//
//  ExchangeRateView.swift
//  LOTRConverter17
//
//  Created by Shreyas Sahoo on 25/03/24.
//

import SwiftUI

struct ExchangeRateView: View {
    let leftImage : ImageResource
    let rightImage : ImageResource
    let text : String
    var body: some View {
        HStack{
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(width: 33)
            Text(text)
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(width: 33)
        }
    }
}
#Preview {
    ExchangeRateView(leftImage: .goldpenny, rightImage: .goldpenny, text: "kdsjaf")
}
