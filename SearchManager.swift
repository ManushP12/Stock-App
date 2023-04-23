//
//  SearchManager.swift
//  TestApp
//
//  Created by Manush Patel on 2023-04-12.
//

import Foundation

final class SearchManager: ObservableObject {
    @Published var searches = [Search] ()
    
    func searchStocks(keyword: String) {
        NetworkManager<SearchResponse>().fetch(from: URL(string: API.symbolSearchURL(for: keyword))!) { (result) in
            switch result {
            case .failure(let err):
                print(err)
            case .success(let resp):
                DispatchQueue.main.async {
                    self.searches = resp.bestMatches
                }
            }
        }
    }
}
