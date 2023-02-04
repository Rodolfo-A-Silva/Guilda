//
//  UIFont+Extension.swift
//  Guilda
//
//  Created by rodolfo silva on 03/02/23.
//

import UIKit

extension UIFont {
    static func customFont(with size: CGFloat, style: String) -> UIFont {
        switch style {
        case "normal":
            return UIFont(name: "HelveticaNeue", size: size)!
        case "bold":
            return UIFont(name: "HelveticaNeue-Bold", size: size)!
        case "italic":
            return UIFont(name: "HelveticaNeue-Italic", size: size)!
        default:
            return UIFont(name: "HelveticaNeue", size: size)!
        }
    }
}
