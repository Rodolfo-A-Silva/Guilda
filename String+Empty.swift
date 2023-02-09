//
//  String+Empty.swift
//  Guilda
//
//  Created by rodolfo silva on 05/09/22.
//

import Foundation

public extension Optional where Wrapped == String {
    var orEmpty: String {
        return self ?? ""
    }
}

