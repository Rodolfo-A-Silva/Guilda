//
//  UILabel+Extension.swift
//  Guilda
//
//  Created by rodolfo silva on 07/02/23.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, size: CGFloat, color: UIColor, textColor: UIColor) {
        self.init(frame: .zero)
        self.text = text
        self.font = font.withSize(size)
        self.backgroundColor = color
        self.textColor = textColor
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
