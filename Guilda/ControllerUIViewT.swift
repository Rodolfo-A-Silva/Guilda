//
//  ControllerUIViewT.swift
//  Guilda
//
//  Created by rodolfo silva on 10/11/22.
//

import UIKit

class ControllerUIViewT: UIView {
    
    lazy var tableview: UITableView = {
        let tableview = UITableView()
        tableview.isUserInteractionEnabled = true
        return tableview
    }()

    // MARK: - Init's
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension ControllerUIViewT: CodeView {
    func buildViewHierarchy() {
        addSubview(tableview)
    }
    
    func setupConstraint() {
        
        tableview.Anchor(top: (topAnchor, 0),
                         left: (leftAnchor, 0),
                         right: (rightAnchor, 0),
                         bottom: (bottomAnchor, 0)
        )
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .darkGray
    }
}
