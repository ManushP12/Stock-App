//
//  News.swift
//  TestApp
//
//  Created by Manush Patel on 2023-03-29.
//

import Foundation


struct News: Identifiable, Codable {
    var id: UUID { return UUID ()}
    var title: String
    var url: String
    var urlToImage: String?
    var imageUrl: String {
        return urlToImage?.replacingOccurrences(of: "http://", with: "https://") ??
        "https://www.macobserver.com/wp-content/uploads/2019/09/workfeatured-apple-news-4.png"
    }
}


