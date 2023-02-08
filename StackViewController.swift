//
//  StackViewController.swift
//  Guilda
//
//  Created by rodolfo silva on 09/11/22.
//

import UIKit

class StackViewController: GuildaUIViewController {
    
    static let colors = [
        UIColor.black,
        UIColor.blue,
        UIColor.purple,
        UIColor.green,
        UIColor.red,
        UIColor.darkGray
    ]
    
    static let text = [
        "Something",
        "Text",
        "Matt",
        "Awesome",
        "What???"
    ]
    
    lazy var labelHeader: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Opa, algo aconteceu"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
       // stackView.axis = .horizontal
       // stackView.backgroundColor = .yellow
        return stackView
    }()
    
    lazy var labelFoot: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Opa, bla bla"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var buttonStack: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonAdd: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .tarde
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.titleLabel?.textAlignment = .center
        button.setTitle("Add", for: .normal)
        return button
    }()
    
    lazy var buttonRemove: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .tarde
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.titleLabel?.textAlignment = .center
        button.setTitle("Remove", for: .normal)
        return button
    }()

    lazy var buttonOrientation: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .tarde
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.titleLabel?.textAlignment = .center
        button.setTitle("Orientation", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureConstraints()
        setupSelectorButton()
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(labelHeader)
        view.addSubview(contentStackView)
        view.addSubview(labelFoot)
        view.addSubview(buttonAdd)
        view.addSubview(buttonRemove)
        view.addSubview(buttonOrientation)
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            labelHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: labelHeader.bottomAnchor, constant: 20),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            //contentStackView.bottomAnchor.constraint(equalTo: buttonAdd.topAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            buttonAdd.heightAnchor.constraint(equalToConstant: 40),
            buttonAdd.widthAnchor.constraint(equalToConstant: 110)
        ])
        
        NSLayoutConstraint.activate([
            labelFoot.topAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: 10),
            labelFoot.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buttonAdd.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonAdd.heightAnchor.constraint(equalToConstant: 40),
            buttonAdd.widthAnchor.constraint(equalToConstant: 110),
            buttonAdd.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            buttonRemove.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonRemove.heightAnchor.constraint(equalToConstant: 40),
            buttonRemove.widthAnchor.constraint(equalToConstant: 110),
            buttonRemove.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])

        NSLayoutConstraint.activate([
            buttonOrientation.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonOrientation.heightAnchor.constraint(equalToConstant: 40),
            buttonOrientation.widthAnchor.constraint(equalToConstant: 110),
            buttonOrientation.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
    
    func setupSelectorButton() {
        buttonAdd.addTarget(self, action: #selector(onAddClicked), for: .touchUpInside)
        buttonRemove.addTarget(self, action: #selector(onRemovedClicked), for: .touchUpInside)
        buttonOrientation.addTarget(self, action: #selector(onOrientationClicked), for: .touchUpInside)
    }
    
    
    @objc func onAddClicked() {
        
        self.buttonStack.backgroundColor = StackViewController.colors.randomElement()
        self.buttonStack.setTitle(StackViewController.text.randomElement(), for: .normal)
        contentStackView.addArrangedSubview(buttonStack)
    }
    
    @objc func onRemovedClicked() {
        if contentStackView.arrangedSubviews.count == 0 {
            return
        }
        
        let view = contentStackView.arrangedSubviews[contentStackView.arrangedSubviews.count - 1]
        view.removeFromSuperview()
    }
    
    @objc func onOrientationClicked() {
        contentStackView.axis = (contentStackView.axis == .horizontal) ? .vertical : .horizontal
    }
}
