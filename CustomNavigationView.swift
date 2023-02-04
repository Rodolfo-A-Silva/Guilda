//
//  CustomNavigationView.swift
//  Guilda
//
//  Created by rodolfo silva on 03/02/23.
//

import UIKit

    //-- Delegate
//protocol ButtonDelegate: AnyObject {
//    func onTap()
//}
class CustomNavigationView: UIView {

    //-- Delegate
  //weak var viewDelegate: ButtonDelegate?
    var backButtonTapped: (() -> Void)?
    
    //-- Closure
  //  var backButtonTapped: (() -> Void)?

    
    // MARK: - View's
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        button.tintColor = .blue
        button.isHidden = false
        button.addTarget(self, action: #selector(goToBack), for: .touchUpInside)
      //  button.addTarget(self, action: #selector(goToBack), for: .touchUpInside)
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

    @objc func goToBack() {
        backButtonTapped?()
    //-- Closure ou delegate
 //   @objc func goToBack() {
         //-- Closure
      //  backButtonTapped?()
        
        //-- Delegate
     //  viewDelegate?.onTap()
        
    }
 //   }
    
//    func methodBack(completionBlock: () -> Void) {
//
//          print("block_Completion")
//          completionBlock()
//    }
//-- Completion
    func methodBack(nome: String, completionBlock: @escaping(String, Bool) -> Void) {
        completionBlock("Silva", true)
    }
}

extension CustomNavigationView: CodeView {
    func buildViewHierarchy() {
        addSubview(backButton)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 25),
            backButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
}
