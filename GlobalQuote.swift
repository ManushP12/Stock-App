//
//  GlobalQuote.swift
//  TestApp
//
//  Created by Manush Patel on 2023-03-13.
//

import Foundation

struct GlobalQuoteResponse: Codable {
    var quote: Quote
    
    private enum CodingKeys: String, CodingKey {
        case quote = "Global Quote"
    }
}


