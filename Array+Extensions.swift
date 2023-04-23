//
//  Array+Extensions.swift
//  TestApp
//
//  Created by Manush Patel on 2023-04-13.
//

import Foundation

extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}
