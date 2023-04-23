//
//  QuoteManagerProtocol.swift
//  TestApp
//
//  Created by Manush Patel on 2023-03-14.
//

import Foundation

protocol QuoteManagerProtocol {
    var quotes: [Quote] {get set}
    func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void)
}



