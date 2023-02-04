//
//  EditProfileController.swift
//  Guilda
//
//  Created by rodolfo silva on 05/09/22.
//
import UIKit

class EditProfileController: UIViewController {
    
    // MARK: - Var's
    var editProfileControllerView: EditProfileControllerView? = nil
    private let viewModel: EditProfileControllerViewModel
    
    // MARK: - Init's
    init(viewModel: EditProfileControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        setupView()
    }
    
    // MARK: - Cycle Life's
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelectorButton()
    }
    
    func setupView() {
        navigationController?.isNavigationBarHidden = true
        view = EditProfileControllerView()
        editProfileControllerView = view as? EditProfileControllerView
        // hideKeyboardOnTap()
        setupTextFieldDelegate()
        viewModel.viewDelegate = self
    }
    
    func setupTextFieldDelegate() {
        editProfileControllerView?.textFielFirstName.delegate = self
        editProfileControllerView?.textFieldLastName.delegate = self
        editProfileControllerView?.textFieldEmail.delegate = self
        editProfileControllerView?.textFieldStateYouFrom.delegate = self
        editProfileControllerView?.textFieldCurrentlyLive.delegate = self
        
        [editProfileControllerView?.textFielFirstName, editProfileControllerView?.textFieldLastName, editProfileControllerView?.textFieldEmail, editProfileControllerView?.textFieldStateYouFrom, editProfileControllerView?.textFieldCurrentlyLive].forEach({ $0?.addTarget(self, action: #selector(editingChanged), for: .editingChanged) })
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        ValidationOfFields()
    }
    
    func ValidationOfFields() {
        guard
            let firstName = editProfileControllerView?.textFielFirstName.text, !firstName.isEmpty,
            let lastName = editProfileControllerView?.textFieldLastName.text, !lastName.isEmpty,
            let job = editProfileControllerView?.textFieldEmail.text, !job.isEmpty,
            let zipCode = editProfileControllerView?.textFieldStateYouFrom.text, !zipCode.isEmpty,
            let cityCurrentlyLive = editProfileControllerView?.textFieldCurrentlyLive.text, !cityCurrentlyLive.isEmpty
        else {
            setButtonStatus(isEnabled: false)
            return
        }
        
        setButtonStatus(isEnabled: true)
    }
    
    func setButtonStatus(isEnabled: Bool) {
        editProfileControllerView?.btnSave.isEnabled = isEnabled ? true : false
        editProfileControllerView?.btnSave.backgroundColor = isEnabled ? .black : .gray
    }
    
    func setupSelectorButton() {
        editProfileControllerView?.buttonBack.addTarget(self, action: #selector(buttonBackPressed), for: .touchUpInside)
        editProfileControllerView?.btnSave.addTarget(self, action: #selector(buttonSavePressed), for: .touchUpInside)
    }
    
    @objc func buttonBackPressed() {
        let allViewControllers : [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        self.navigationController?.popToViewController(allViewControllers[allViewControllers.count-3], animated: true)
    }
    
    @objc func buttonSavePressed() {
        //viewModel.buttonSave()
        guard let firstName = editProfileControllerView?.textFielFirstName.text,
              let lastName = editProfileControllerView?.textFieldLastName.text,
              let jobTitle = editProfileControllerView?.textFieldEmail.text
                //let currentlyLive = registrationCompleteView?.textFieldCurrentlyLive.text
        else { return }
    }  
}

extension EditProfileController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case editProfileControllerView?.textFielFirstName:
            editProfileControllerView?.textFielFirstName.layer.borderColor = UIColor.moodyBlue.cgColor
            editProfileControllerView?.textFieldLastName.layer.borderColor = UIColor.gainsboro.cgColor
            editProfileControllerView?.textFieldEmail.layer.borderColor = UIColor.gainsboro.cgColor
            editProfileControllerView?.textFieldCurrentlyLive.layer.borderColor = UIColor.gainsboro.cgColor
            editProfileControllerView?.textFieldStateYouFrom.layer.borderColor = UIColor.gainsboro.cgColor
            
        case editProfileControllerView?.textFieldLastName:
            editProfileControllerView?.textFieldLastName.layer.borderColor = UIColor.moodyBlue.cgColor
            editProfileControllerView?.textFielFirstName.layer.borderColor = UIColor.gainsboro.cgColor
            editProfileControllerView?.textFieldEmail.layer.borderColor = UIColor.gainsboro.cgColor
            editProfileControllerView?.textFieldCurrentlyLive.layer.borderColor = UIColor.gainsboro.cgColor
            editProfileControllerView?.textFieldStateYouFrom.layer.borderColor = UIColor.gainsboro.cgColor
            
        case editProfileControllerView?.textFieldEmail:
            editProfileControllerView?.textFieldEmail.layer.borderColor = UIColor.moodyBlue.cgColor
            editProfileControllerView?.textFielFirstName.layer.borderColor = UIColor.gainsboro.cgColor
            editProfileControllerView?.textFieldLastName.layer.borderColor = UIColor.gainsboro.cgColor
            editProfileControllerView?.textFieldCurrentlyLive.layer.borderColor = UIColor.gainsboro.cgColor
            editProfileControllerView?.textFieldStateYouFrom.layer.borderColor = UIColor.gainsboro.cgColor
            
        case editProfileControllerView?.textFieldStateYouFrom:
            editProfileControllerView?.textFieldStateYouFrom.layer.borderColor = UIColor.moodyBlue.cgColor
            editProfileControllerView?.textFielFirstName.layer.borderColor = UIColor.gainsboro.cgColor
            editProfileControllerView?.textFieldLastName.layer.borderColor = UIColor.gainsboro.cgColor
            editProfileControllerView?.textFieldCurrentlyLive.layer.borderColor = UIColor.gainsboro.cgColor
            editProfileControllerView?.textFieldEmail.layer.borderColor = UIColor.gainsboro.cgColor
            
        case editProfileControllerView?.textFieldCurrentlyLive:
            editProfileControllerView?.textFieldCurrentlyLive.layer.borderColor = UIColor.moodyBlue.cgColor
            editProfileControllerView?.textFielFirstName.layer.borderColor = UIColor.gainsboro.cgColor
            editProfileControllerView?.textFieldLastName.layer.borderColor = UIColor.gainsboro.cgColor
            editProfileControllerView?.textFieldEmail.layer.borderColor = UIColor.gainsboro.cgColor
            editProfileControllerView?.textFieldStateYouFrom.layer.borderColor = UIColor.gainsboro.cgColor
        default:
            break
        }
    }
    
}

extension EditProfileController: EditProfileControllerViewModelDelegatete {
    func registerCompleteDidFinishSuccess() {
        debugPrint("success here")
    }
    
    func registerCompleteDidFinishError() {
        debugPrint("failed here")
    }
    
}
