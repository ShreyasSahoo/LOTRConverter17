//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Shreyas Sahoo on 24/03/24.
//

import SwiftUI
import TipKit
struct ContentView: View {
    
   @State var showExchangeInfo = false
   @State var showSelectCurrency = false
    @FocusState var leftTyping
    @FocusState var rightTyping

   @State var leftAmount = ""
   @State var rightAmount = ""
   @State var leftCurrency : Currency = .silverPiece
   @State var rightCurrency : Currency = .goldPiece
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()

            VStack{
                //prancing pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                //currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    
                //currency conversion section
                HStack{
                    
                    VStack{
                        
                        HStack{
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width:33)
                            
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                       TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            
                    
                    }
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .symbolEffect(.pulse)
                    
                    VStack{
                        
                        HStack{
                           
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width:33)
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        TextField("Amount", text: $rightAmount)
                            .focused($rightTyping)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            
                    }
                    
                    }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                .popoverTip(CurrencyTip(),arrowEdge: .bottom)
                Spacer()
                HStack{
                    Spacer()
                    
                    Button{
                        showExchangeInfo.toggle()
                        print(showExchangeInfo)
                        
                    } label:{
                        Image(systemName: "info.circle.fill")
                            .font(.title)
                            .foregroundStyle(.white)
                    }
                }
                .padding(.trailing)
                .onChange(of: leftAmount){
                    if leftTyping{
                        rightAmount = leftCurrency.convert(amountString: leftAmount, currency: rightCurrency)
                    }
                    
                }
                .onChange(of: rightAmount){
                    if rightTyping{
                        leftAmount = rightCurrency.convert(amountString: rightAmount, currency: leftCurrency)
                    }
                    
                }
                .task{
                    try? Tips.configure()
                }
                .onChange(of: leftCurrency){
                    leftAmount = rightCurrency.convert(amountString: rightAmount, currency: leftCurrency)
                }
                .onChange(of: rightCurrency){
                    rightAmount = leftCurrency.convert(amountString: leftAmount, currency: rightCurrency)
                }
                    .sheet(isPresented: $showExchangeInfo){
                        ExchangeInfoView()
                    }
                    .sheet(isPresented: $showSelectCurrency ){
                        SelectCurrencyView(topCurrency: $leftCurrency,bottomCurrency: $rightCurrency)
                    }

                    
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
