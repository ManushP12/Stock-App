//
//  MiniQuoteView.swift
//  TestApp
//
//  Created by Manush Patel on 2023-03-15.
//

import SwiftUI

struct MiniQuoteView: View {
    
    @ObservedObject var stockQuotes: StockQuoteManager
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(stockQuotes.quotes) { quote in
                    VStack {
                        Text(quote.symbol)
                            .font(.subheadline)
                            .bold()
                        
                        Text(quote.price)
                            .font(.subheadline)
                        
                        Text(quote.change)
                            .font(.subheadline)
                            .padding(.horizontal)
                            .frame(width: 100)
                            .background(RoundedRectangle(cornerRadius: 5)
                                        .fill(Double(quote.change)! > 0.0 ? Color.green : Color.red),
                                        alignment: .trailing)
                        
                    } .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.2)))
                    
                        .foregroundColor(.white)
                    
                }
            }
            
        }
//        .onAppear {
//            stockQuotes.download(stocks: [], completion: { _ in})
//        }
    }
}
