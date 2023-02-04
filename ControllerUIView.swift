//
//  ControllerUIView.swift
//  Guilda
//
//  Created by rodolfo silva on 07/07/22.
//

import UIKit

class ControllerUIView: UIView {
    
    // MARK: - View's
    lazy var viewCard: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "woman"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.roundCorners(corners: [.topLeft, .topRight], radius: 15)
        return view
    }()
    
    lazy var lblTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "Order Summary"
        return label
    }()
    
    lazy var lblSubTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: "#828282")
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "You can now listen to millions of\nsongs, audiobooks, and podcasts on\nany device anywhere you like!"
        return label
    }()
    
    lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .whiteSmoke
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalCentering
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    

    lazy var imageView2: UIImageView = {
        let imageView2 = UIImageView(image: UIImage(named: "woman"))
        imageView2.roundCorners(corners: [.allCorners], radius: 10)
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        return imageView2
    }()
    
    lazy var buttonchange: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setTitle("Change", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        button.underline()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalCentering
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var lblPlanTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Annual"
        return label
    }()
    
    lazy var lblPriceSubTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: "#828282")
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "ear"
        return label
    }()
    
    lazy var lblPlanTitle2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Annual"
        return label
    }()
    
    lazy var lblPriceSubTitle2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: "#828282")
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "ear"
        return label
    }()
    
    lazy var buttonPrimary: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(UIColor.gray, for: .normal)
        button.setTitle("Cancel Order", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonSecond: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.dropShadow()
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Proceed to Payment", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var horizontalStackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalCentering
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Criar botao primário e secundário - addSubiew - criar constraint
    
    // MARK: - Init's
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension ControllerUIView: CodeView {
    func buildViewHierarchy() {
        addSubview(viewCard)
        viewCard.addSubview(imageView)
        viewCard.addSubview(lblTitle)
        viewCard.addSubview(lblSubTitle)
        viewCard.addSubview(view)
       
        // horizontalStackView
        view.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(imageView2)
       // horizontalStackView.addArrangedSubview(buttonchange)

        // TO DO verticaStackView
        horizontalStackView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(lblPlanTitle)
        verticalStackView.addArrangedSubview(lblPriceSubTitle)
        
        // horizontalStackView2
        horizontalStackView.addSubview(horizontalStackView2)
        horizontalStackView2.addArrangedSubview(lblPlanTitle2)
        horizontalStackView2.addArrangedSubview(lblPriceSubTitle2)
        
        viewCard.addSubview(buttonPrimary)
        viewCard.addSubview(buttonSecond)
        
        
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            viewCard.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            viewCard.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            viewCard.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            viewCard.heightAnchor.constraint(equalToConstant: 700),
            viewCard.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100)
        ])
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: viewCard.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: viewCard.trailingAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.topAnchor.constraint(equalTo: viewCard.topAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            lblTitle.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            lblTitle.heightAnchor.constraint(equalToConstant: 25),
            lblTitle.widthAnchor.constraint(equalToConstant: 200),
            lblTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            lblSubTitle.leadingAnchor.constraint(equalTo: viewCard.leadingAnchor, constant: 16),
            lblSubTitle.trailingAnchor.constraint(equalTo: viewCard.trailingAnchor, constant: -16),
            lblSubTitle.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: viewCard.leadingAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: viewCard.trailingAnchor, constant: -16),
            view.topAnchor.constraint(equalTo: lblSubTitle.bottomAnchor, constant: 20),
            view.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            horizontalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: horizontalStackView.topAnchor,constant: -5),
            verticalStackView.heightAnchor.constraint(equalToConstant: 20),
            verticalStackView.leadingAnchor.constraint(equalTo: imageView2.leadingAnchor,constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            lblPriceSubTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            lblPriceSubTitle2.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -50)
        ])
        
        NSLayoutConstraint.activate([
           // horizontalStackView2.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor,constant: -20),
            horizontalStackView2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            horizontalStackView2.heightAnchor.constraint(equalToConstant: 20),
            horizontalStackView2.leadingAnchor.constraint(equalTo: imageView2.leadingAnchor,constant: 100)
        ])
        
        
        NSLayoutConstraint.activate([
            imageView2.heightAnchor.constraint(equalToConstant: 60),
            imageView2.widthAnchor.constraint(equalToConstant: 60),
            imageView2.leadingAnchor.constraint(equalTo: viewCard.leadingAnchor, constant: 30)
        ])
        
//        NSLayoutConstraint.activate([
//            buttonchange.heightAnchor.constraint(equalToConstant: 20),
//            buttonchange.widthAnchor.constraint(equalToConstant: 60),
//            buttonchange.trailingAnchor.constraint(equalTo: viewCard.trailingAnchor, constant: -30)
//        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .gainsboro
    }
}


