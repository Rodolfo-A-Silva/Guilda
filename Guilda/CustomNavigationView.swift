//
//  CustomNavigationView.swift
//  Guilda
//
//  Created by rodolfo silva on 14/01/23.
//
import UIKit

//protocol ButtonDelegate: AnyObject {
//    func onTap()
//}

class CustomNavigationView: UIView {
    
  //weak var viewDelegate: ButtonDelegate?
    var backButtonTapped: (() -> Void)?
    
    // MARK: - View's
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "chevron.left")
        button.setImage(image, for: UIControl.State())
        button.tintColor = .blue
        button.isHidden = false
        button.addTarget(self, action: #selector(goToBack), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init's
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
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
        addSubview(backButton)
    }
    
    // MARK: - Constraint
    func setupConstraint() {
        
        backButton.Anchor(top: (safeAreaLayoutGuide.topAnchor, 10),
                          left: (safeAreaLayoutGuide.leftAnchor, 10),
                          width: 20,
                          height: 20)
    }
    
    @objc func goToBack() {
        backButtonTapped?()
     //  viewDelegate?.onTap()
        
    }
    
//    func methodBack(completionBlock: () -> Void) {
//
//          print("block_Completion")
//          completionBlock()
//    }
}


