//
//  CodeView.swift
//  ViewCode
//
//  Created by Rodolfo Alves da Silva on 28/01/22.
//

import Foundation

protocol CodeView {
    func buildViewHierarchy()
    func setupConstraint()
    func setupAdditionalConfiguration()
    func setupView()
}

extension CodeView {
    func setupView() {
        buildViewHierarchy()
        setupConstraint()
        setupAdditionalConfiguration()
    }
}
