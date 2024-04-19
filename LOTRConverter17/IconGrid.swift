//
//  IconGrid.swift
//  LOTRConverter17
//
//  Created by Shreyas Sahoo on 30/03/24.
//

import SwiftUI

struct IconGrid: View {
    var columns = [GridItem(),GridItem(),GridItem()]
    @Binding var currency : Currency
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(Currency.allCases){ currency in
                if self.currency == currency {
                    CurrencyView(imageName: currency.image,
                                 currencyName: currency.name)
                    .shadow(color:.black,radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .overlay{
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 3)
                            .opacity(0.5)
                    }
                }
                else{
                    CurrencyView(imageName: currency.image,
                                 currencyName: currency.name)
                    .onTapGesture {
                        self.currency = currency
                    }
                }
                
            }
        }
    }
}

#Preview {
    IconGrid(currency: .constant(.goldPenny))
}
