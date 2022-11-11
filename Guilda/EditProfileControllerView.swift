//
//  EditProfileControllerView.swift
//  Guilda
//
//  Created by rodolfo silva on 05/09/22.
//
import UIKit
import SwiftUI

struct ViewPreview: UIViewRepresentable {
    let viewBuilder: () -> UIView
    
    init(_ viewBuilder: @escaping () -> UIView) {
        self.viewBuilder = viewBuilder
    }
    
    func makeUIView(context: Context) -> some UIView {
        viewBuilder()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // Nothing here
    }
}

struct ProFileViewController: PreviewProvider {
    static var previews: some View {
        ViewPreview {
            EditProfileControllerView()
            
        }
    }
}

class EditProfileControllerView: UIView, UITextViewDelegate {
    
    lazy var buttonBack: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.autoresizingMask = .flexibleHeight
        scrollView.bounces = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 870)
        return scrollView
    }()
    
    lazy var progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.trackTintColor = .gainsboro
        progressView.progressTintColor = .black
        return progressView
    }()
    
    lazy var lblTitleHeader: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Complete your profile"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var lblSubTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Finish setup to publish profile"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var view: UIView = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gainsboro.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var viewCenter: UIView = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var btnAboutYou: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gainsboro.cgColor
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .center
        button.setTitle("About you", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var btnProfessional: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gainsboro
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gainsboro.cgColor
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .center
        button.setTitle("Professional", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var lblFirstName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "First Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textFielFirstName: MaskTextField = {
        let textField = MaskTextField()
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textColor = .matterhorn
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gainsboro.cgColor
        textField.layer.cornerRadius = 8
        textField.autocorrectionType = .no
        textField.placeholder = "Ex: Marcus"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var lblLastName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Last Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textFieldLastName: MaskTextField = {
        let textField = MaskTextField()
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textColor = .matterhorn
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gainsboro.cgColor
        textField.layer.cornerRadius = 8
        textField.autocorrectionType = .no
        textField.placeholder = "Ex: D'Antonio"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var lblEmail: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Email"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textFieldEmail: MaskTextField = {
        let textField = MaskTextField()
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textColor = .matterhorn
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gainsboro.cgColor
        textField.layer.cornerRadius = 8
        textField.autocorrectionType = .no
        textField.placeholder = "marcus@senate.gov"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var lblStateYouFrom: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "What State are you from?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textFieldStateYouFrom: MaskTextField = {
        let textField = MaskTextField()
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textColor = .matterhorn
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gainsboro.cgColor
        textField.layer.cornerRadius = 8
        textField.autocorrectionType = .no
        textField.keyboardType = .numberPad
        textField.placeholder = "Ex: Texas"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var lblCurrentlyLive: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Where do you currently live?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textFieldCurrentlyLive: MaskTextField = {
        let textField = MaskTextField()
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textColor = .matterhorn
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gainsboro.cgColor
        textField.layer.cornerRadius = 8
        textField.autocorrectionType = .no
        textField.placeholder = "Seatle"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var btnSave: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .center
        button.setTitle("Save", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
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
}

extension EditProfileControllerView: CodeView {
    func buildViewHierarchy() {
        addSubview(buttonBack)
        addSubview(scrollView)
        scrollView.addSubview(progressView)
        progressView.frame = CGRect(x: 10, y: 20, width: 360, height: 20)
        progressView.setProgress(0.5, animated: false)
        scrollView.addSubview(lblTitleHeader)
        scrollView.addSubview(lblSubTitle)
        scrollView.addSubview(view)
        scrollView.addSubview(viewCenter)
        scrollView.addSubview(btnAboutYou)
        scrollView.addSubview(btnProfessional)
        scrollView.addSubview(lblFirstName)
        scrollView.addSubview(textFielFirstName)
        scrollView.addSubview(lblLastName)
        scrollView.addSubview(textFieldLastName)
        scrollView.addSubview(lblEmail)
        scrollView.addSubview(textFieldEmail)
        scrollView.addSubview(lblStateYouFrom)
        scrollView.addSubview(textFieldStateYouFrom)
        scrollView.addSubview(lblCurrentlyLive)
        scrollView.addSubview(textFieldCurrentlyLive)
        scrollView.addSubview(btnSave)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            buttonBack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            buttonBack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: buttonBack.bottomAnchor, constant: 10),
            scrollView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: buttonBack.bottomAnchor, constant: 20)
        ])

        NSLayoutConstraint.activate([
            lblTitleHeader.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 22),
            lblTitleHeader.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            lblSubTitle.topAnchor.constraint(equalTo: lblTitleHeader.bottomAnchor, constant: 4),
            lblSubTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: lblSubTitle.bottomAnchor, constant: 24),
            view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            view.heightAnchor.constraint(equalToConstant: 48)
        ])

        NSLayoutConstraint.activate([
            viewCenter.topAnchor.constraint(equalTo: lblSubTitle.bottomAnchor, constant: 24),
            viewCenter.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewCenter.widthAnchor.constraint(equalToConstant: 1),
            viewCenter.heightAnchor.constraint(equalToConstant: 48)
        ])

        NSLayoutConstraint.activate([
            btnAboutYou.topAnchor.constraint(equalTo: lblSubTitle.bottomAnchor, constant: 24),
            btnAboutYou.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            btnAboutYou.trailingAnchor.constraint(equalTo: viewCenter.trailingAnchor, constant: 0),
            btnAboutYou.heightAnchor.constraint(equalToConstant: 48)
        ])

        NSLayoutConstraint.activate([
            btnProfessional.topAnchor.constraint(equalTo: lblSubTitle.bottomAnchor, constant: 24),
            btnProfessional.leadingAnchor.constraint(equalTo: viewCenter.leadingAnchor, constant: 0),
            btnProfessional.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            btnProfessional.heightAnchor.constraint(equalToConstant: 48)
        ])

        NSLayoutConstraint.activate([
            lblFirstName.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 24),
            lblFirstName.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            lblFirstName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            textFielFirstName.topAnchor.constraint(equalTo: lblFirstName.bottomAnchor, constant: 8),
            textFielFirstName.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            textFielFirstName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textFielFirstName.heightAnchor.constraint(equalToConstant: 48)
        ])

        NSLayoutConstraint.activate([
            lblLastName.topAnchor.constraint(equalTo: textFielFirstName.bottomAnchor, constant: 24),
            lblLastName.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            lblLastName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            textFieldLastName.topAnchor.constraint(equalTo: lblLastName.bottomAnchor, constant: 8),
            textFieldLastName.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            textFieldLastName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textFieldLastName.heightAnchor.constraint(equalToConstant: 48)
        ])

        NSLayoutConstraint.activate([
            lblEmail.topAnchor.constraint(equalTo: textFieldLastName.bottomAnchor, constant: 24),
            lblEmail.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            lblEmail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            textFieldEmail.topAnchor.constraint(equalTo: lblEmail.bottomAnchor, constant: 8),
            textFieldEmail.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            textFieldEmail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textFieldEmail.heightAnchor.constraint(equalToConstant: 48)
        ])

        NSLayoutConstraint.activate([
            lblStateYouFrom.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 24),
            lblStateYouFrom.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            lblStateYouFrom.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            textFieldStateYouFrom.topAnchor.constraint(equalTo: lblStateYouFrom.bottomAnchor, constant: 8),
            textFieldStateYouFrom.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            textFieldStateYouFrom.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textFieldStateYouFrom.heightAnchor.constraint(equalToConstant: 48)
        ])

        NSLayoutConstraint.activate([
            lblCurrentlyLive.topAnchor.constraint(equalTo: textFieldStateYouFrom.bottomAnchor, constant: 24),
            lblCurrentlyLive.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            lblCurrentlyLive.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            textFieldCurrentlyLive.topAnchor.constraint(equalTo: lblCurrentlyLive.bottomAnchor, constant: 8),
            textFieldCurrentlyLive.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            textFieldCurrentlyLive.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textFieldCurrentlyLive.heightAnchor.constraint(equalToConstant: 48)
        ])

        NSLayoutConstraint.activate([
            btnSave.topAnchor.constraint(equalTo: textFieldCurrentlyLive.bottomAnchor, constant: 105),
            btnSave.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            btnSave.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            btnSave.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
}
