//
//  CurrencyView.swift
//  LOTRConverter17
//
//  Created by Shreyas Sahoo on 25/03/24.
//

import SwiftUI

struct CurrencyView: View {
    var imageName : ImageResource
    var currencyName : String
    var body: some View {
        ZStack(alignment: .bottom){
            Image(imageName)
                .resizable()
                .scaledToFit()
            
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(.brown.opacity(0.75))
            
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}
#Preview {
    CurrencyView(imageName: .goldpenny, currencyName: "Gold Penny")
}
