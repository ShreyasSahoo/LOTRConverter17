//
//  SelectCurrencyView.swift
//  LOTRConverter17
//
//  Created by Shreyas Sahoo on 25/03/24.
//

import SwiftUI

struct SelectCurrencyView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency : Currency
    @Binding var bottomCurrency : Currency
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                Text("Select the currency you are starting with : ")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
//                CurrencyView()
                IconGrid(currency: $topCurrency)
                
                Text("Select the currency you would like to convert to : ")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                IconGrid(currency: $bottomCurrency)
                
                Button("Done"){
                    print(dismiss)
                    dismiss()
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.title)
                .foregroundStyle(.white)
            }
            .padding()
            }
        }
    }


#Preview {
    SelectCurrencyView(topCurrency: .constant(.copperPenny), bottomCurrency: .constant(.silverPenny))
}


