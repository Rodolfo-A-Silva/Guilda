//
//  PopUpView.swift
//  Guilda
//
//  Created by rodolfo silva on 03/02/23.
//

import Foundation
import UIKit

 class CustomPopup: UIView {
     
     lazy var contentView: UIView = {
         var view = UIView()
         view.backgroundColor = .white
         view.layer.cornerRadius = 20
         view.layer.masksToBounds = false
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
     
     lazy var lblTitle: UILabel = {
         let label = UILabel()
         label.font = UIFont.customFont(with: 22, style: "bold")
         label.textColor = .black
         label.numberOfLines = 0
         label.text = "Title here"
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
     
     lazy var lblDescription: UILabel = {
         let label = UILabel()
         label.font = UIFont.customFont(with: 16, style: "normal")
         label.textColor = .blackTwo
         label.numberOfLines = 0
         label.text = "Title here  jhssdahfkjh sdfhjksdahf kjsahf Title here  jhssdahfkjh sdfhjksdahf kjsahf Title here  jhssdahfkjh sdfhjksdahf kjsahf"
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()

     lazy var primaryButton: UIButton = {
         let button = UIButton()
         button.backgroundColor = .black
         button.layer.cornerRadius = 8
         button.setTitleColor(.white, for: .normal)
         button.titleLabel?.textAlignment = .center
         button.setTitle("Primary", for: .normal)
         button.translatesAutoresizingMaskIntoConstraints = false
         button.addTarget(self, action: #selector(primaryButtonTapped), for: .touchUpInside)
         button.isHidden = false
         return button
     }()
     
     lazy var secondaryButton: UIButton = {
         let button = UIButton()
         button.backgroundColor = .navyBlue
         button.layer.cornerRadius = 8
         button.setTitleColor(.white, for: .normal)
         button.titleLabel?.textAlignment = .center
         button.setTitle("Secondary", for: .normal)
         button.translatesAutoresizingMaskIntoConstraints = false
         button.addTarget(self, action: #selector(secondaryButtonTapped), for: .touchUpInside)
         button.isHidden = false
         return button
     }()
     
     // MARK: - Init's
     override init(frame: CGRect) {
         super.init(frame: frame)
     }
     
     init() {
         super.init(frame: .zero)
         setupView()
     }
     
     required init?(coder: NSCoder) {
         fatalError()
     }

    @objc func primaryButtonTapped() {
         print("primary touch")
        // Handle primary button tap event
    }

    @objc func secondaryButtonTapped() {
        print("secondary touch")
        // Handle secondary button tap event
    }
}

extension CustomPopup: CodeView {
    func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(lblTitle)
        contentView.addSubview(lblDescription)
        contentView.addSubview(primaryButton)
        contentView.addSubview(secondaryButton)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 0),
            contentView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 0),
            contentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 26),
            contentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -26),
            contentView.heightAnchor.constraint(equalToConstant: 280),
            contentView.widthAnchor.constraint(equalToConstant: 260)
        ])
        
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            lblTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            lblDescription.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0),
            lblDescription.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 15),
            lblDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            lblDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            primaryButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            primaryButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            primaryButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            primaryButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            secondaryButton.bottomAnchor.constraint(equalTo: primaryButton.topAnchor, constant: -10),
            secondaryButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            secondaryButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            secondaryButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    } 
}
