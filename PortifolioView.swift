//
//  PortifolioView.swift
//  Guilda
//
//  Created by rodolfo silva on 07/02/23.
//

import Foundation
import UIKit

class PortifolioView: UIView {
    
    // MARK: - View's
    private lazy var stack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 24
        return stackView
    }()
    
    lazy var skillOne: PortifolioSkillsList = {
        let variable = PortifolioSkillsList(image: UIImage.actions,
                                            text: "teste componente")
        variable.imageIcon.heightAnchor.constraint(equalToConstant: 100).isActive = true
        variable.imageIcon.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return variable
    }()
    
    private lazy var skillTwo: PortifolioSkillsList = {
        let variable = PortifolioSkillsList(image: UIImage.add,
                                            text: "second componente")
        variable.imageIcon.heightAnchor.constraint(equalToConstant: 60).isActive = true
        variable.imageIcon.widthAnchor.constraint(equalToConstant: 60).isActive = true
        return variable
    }()
    
    private lazy var skillThree: PortifolioSkillsList = {
        let variable = PortifolioSkillsList(image: UIImage.checkmark,
                                            text: "third componente")
        variable.imageIcon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        variable.imageIcon.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return variable
    }()
    
    // MARK: - Init's
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubViews()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func addSubViews() {
        addSubview(stack)
        stack.addArrangedSubview(skillOne)
        stack.addArrangedSubview(skillTwo)
        stack.addArrangedSubview(skillThree)
    }
    
    // MARK: - Constraint
    func setupConstraint() {
        stack.Anchor(top: (self.topAnchor, 24),
                     leading: (self.leadingAnchor, 36),
                     trailing: (self.trailingAnchor, 36),
                     bottom: (self.bottomAnchor, 24))
    }
}
