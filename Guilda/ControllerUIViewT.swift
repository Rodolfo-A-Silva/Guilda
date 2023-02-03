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

    
//    lazy var stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = NSLayoutConstraint.Axis.vertical
//        stackView.alignment = .center
//        stackView.backgroundColor = .yellow
//        return stackView
//    }()
//
//    lazy var viewScheduling: UIView = {
//        let view = UIView()
//        view.layer.cornerRadius = 10
//        view.backgroundColor = .blue
//        view.isHidden = false
//        return view
//    }()
//
//    lazy var labelTitleScheduling: UILabel = {
//        let label = UILabel()
//        label.numberOfLines = 0
//        label.text = "Este agendamento não garante o sucesso da transação. Confira o saldo da sua conta na data agendada."
//        return label
//    }()
//
//    lazy var iconScheduling: UIImageView = {
//        let img = UIImageView()
//        img.backgroundColor = .red
//        return img
//    }()
    
    
   
    
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
       
//        stackView.addSubview(viewScheduling)
//        viewScheduling.addSubview(iconScheduling)
//        viewScheduling.addSubview(labelTitleScheduling)
    }
    
    func setupConstraint() {
        
        tableview.Anchor(top: (topAnchor, 0),
                         left: (leftAnchor, 0),
                         right: (rightAnchor, 0),
                         bottom: (bottomAnchor, 0)
        )
        
//        stackView.Anchor(top: (topAnchor, 10),
//                         left: (leftAnchor, 20),
//                         right: (rightAnchor, 20)
//        )
//
//        viewScheduling.Anchor(top: (stackView.topAnchor, 0),
//                              left: (stackView.leftAnchor, 0),
//                              right: (stackView.rightAnchor, 0)
//        )
//
//        labelTitleScheduling.Anchor(centerY: (viewScheduling.centerYAnchor, 0),
//                                    top: (viewScheduling.topAnchor, 30),
//                                    left: (iconScheduling.rightAnchor, 10),
//                                    right: (viewScheduling.rightAnchor, 10),
//                                    bottom: (viewScheduling.bottomAnchor, 30)
//        )
//
//        iconScheduling.Anchor(centerY: (labelTitleScheduling.centerYAnchor, 0),
//                              left: (viewScheduling.leftAnchor, 10),
//                              width: 30,
//                              height: 30
//        )
//
     
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .darkGray
    }
}
