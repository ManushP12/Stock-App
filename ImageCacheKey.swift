//
//  ImageCacheKey.swift
//  TestApp
//
//  Created by Manush Patel on 2023-04-09.
//


import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
    static var defaultValueKey: ImageCache { defaultValue }
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
