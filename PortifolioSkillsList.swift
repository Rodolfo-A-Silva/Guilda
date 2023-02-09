//
//  PortifolioSkillsList.swift
//  Guilda
//
//  Created by rodolfo silva on 07/02/23.
//

import Foundation
import UIKit

public class PortifolioSkillsList: UIView {
    
    // MARK: - View's
    private lazy var stack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        return stackView
    }()
    
    lazy var imageIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.isUserInteractionEnabled = false
        return image
    }()
    
    lazy var lblTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Init's
    init(image: UIImage, text: String) {
        super.init(frame: .zero)
        setupView()
        imageIcon.image = image
        lblTitle.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupView() {
        backgroundColor = .white
        addSubViews()
        setupConstraint()
    }
    
    func addSubViews() {
        addSubview(stack)
        stack.addArrangedSubview(imageIcon)
        stack.addArrangedSubview(lblTitle)
    }
    
    // MARK: - Constraint
    func setupConstraint() {
        stack.Anchor(top: (self.topAnchor, 24),
                     leading: (self.leadingAnchor, 36),
                     trailing: (self.trailingAnchor, 36),
                     bottom: (self.bottomAnchor, 24))
    }
}
