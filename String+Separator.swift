//
//  String+Separator.swift
//  Guilda
//
//  Created by rodolfo silva on 05/09/22.
//

import UIKit

public extension String {
    
    func separate(every stride: Int = 4, with separator: Character = " ") -> String {
        return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
    }
    
    func remove(from: Character) -> String? {
        if let _ = self.firstIndex(of: from) {
            return (self.range(of: String(from))?.lowerBound).map { substringFrom in
                String(self[..<substringFrom])
            }
        } else {
            return self
        }
    }
}

public extension Collection {
    
    var pairs: [SubSequence] {
        var startIndex = self.startIndex
        let count = self.count
        let n = count/2 + count % 2
        return (0..<n).map { _ in
            let endIndex = index(startIndex, offsetBy: 2, limitedBy: self.endIndex) ?? self.endIndex
            defer { startIndex = endIndex }
            return self[startIndex..<endIndex]
        }
    }
    
}

public extension Collection {
    
    func distance(to index: Index) -> Int { distance(from: startIndex, to: index) }
    
}

public extension StringProtocol where Self: RangeReplaceableCollection {

    func inserting<S: StringProtocol>(separator: S, condition: (Int) -> (Bool)) -> Self {
        var string = self
        
        for index in indices.dropFirst().reversed()
            where condition(distance(to: index)) {
                string.insert(contentsOf: separator, at: index)
            }
        
        return string
    }
    
}

public extension StringProtocol {
    
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
    
}
