//
//  API.swift
//  TestApp
//
//  Created by Manush Patel on 2023-03-13.
//

import Foundation

struct API {
    static var baseURL: String {
        return "https://www.alphavantage.co/query?"
    }
    
    static func symbolSearchURL(for searchKey: String) -> String {
        return urlBy(symbol: .search, searchKey: searchKey)
    }
    
    static func quoteUrl (for searchKey: String) -> String {
        return urlBy(symbol: .quote, searchKey: searchKey)
    }
    
    private static func urlBy(symbol: SymbolFunction, searchKey: String) -> String {
        
        switch symbol {
        //case .search:
            //return "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(searchKey)&apikey=NILNP8GJI4352BQ5"
        //case .quote:
            //return "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=\(searchKey)&apikey=NILNP8GJI4352BQ5"
        
        case .search:
            return "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(searchKey)&apikey=NILNP8GJI4352BQ5"
        case .quote:
            return "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=\(searchKey)&apikey=NILNP8GJI4352BQ5"
        
        }
    }
    
    enum SymbolFunction: String {
        case search = "SYMBOL_SEARCH"
        case quote = "GLOBAL_QUOTE"
    }
    
}

extension API {
    static var key: String {
        return "NILNP8GJI4352BQ5"
    }
}

//alphavantage.co/query?function=GLOBAL_QUOTE&symbol=IBM&apikey=NILNP8GJI4352BQ5


