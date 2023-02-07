//
//  AssetsColor.swift
//  Guilda
//
//  Created by rodolfo silva on 03/02/23.
//

import Foundation
import UIKit

public enum AssetsColor: String {
    case whiteTwo
    case whiteSmoke
    case veryLightPinkTwo
    case gainsboro
    case veryLightPinkThree
    case veryLightPinkFour
    case veryLightPink
    case brownGrey
    case grey
    case brownishGreyTwo
    case lightGrey
    case lightBackgorundGrey
    case backgorundGrey
    case matterhorn
    case doveGray
    case greyishBrown
    case blackTwo
    case blackThree
    case blackFour
 
}

public extension UIColor {
    static func appColors(_ name: AssetsColor) -> UIColor {
        return UIColor(named: name.rawValue, in: .main, compatibleWith: nil) ?? UIColor()
    }
    
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

