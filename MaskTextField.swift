//
//  MaskTextField.swift
//  Guilda
//
//  Created by rodolfo silva on 05/09/22.
//

import UIKit

open class MaskTextField: UITextField {
    
    public let rightButton: UIButton = {
        let button = UIButton(type: .custom)
        button.isHidden = true
        return button
    }()
    
    public var errorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .tarde
        label.numberOfLines = 0
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // damn, maskView is just mask in Swift
    public private(set) var stringMask: StringMask?
    fileprivate weak var realDelegate: UITextFieldDelegate?
    
    override weak open var delegate: UITextFieldDelegate? {
        get {
            return self.realDelegate
        }
        
        set (newValue) {
            self.realDelegate = newValue
            super.delegate = self
        }
    }
    
    public var callShouldChangeCharactersInAfterVerification: Bool = false
    
    public var unmaskedText: String? {
        get {
            return self.stringMask?.unmask(string: self.text) ?? self.text
        }
    }
    
    @IBInspectable open var isPassword: Bool = false {
        didSet {
            if isPassword {
                setupEyeButton()
            }
        }
    }
     
    @IBInspectable open var maskString: String? {
        didSet {
            guard let maskString = self.maskString else { return }
            self.stringMask = StringMask(mask: maskString)
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commonInit()
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        self.commonInit()
    }
    
    func commonInit() {
        super.delegate = self
        setupErrorLabel()
    }
    
    func setupErrorLabel() {
        addSubview(errorLabel)
        NSLayoutConstraint.activate([
            errorLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            errorLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            errorLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: 4)
        ])
    }
    
    func setupEyeButton() {
        isSecureTextEntry = true
        rightViewMode = .always
        rightButton.isHidden = false
        rightButton.setImage(UIImage(named:"eye_open"), for: .normal)
        rightButton.addTarget(self, action: #selector(toggleShowHide), for: .touchUpInside)
        rightButton.frame = CGRect(x:0, y:0, width:28, height:28)
        rightView = rightButton
    }
    
    @objc
    func toggleShowHide(button: UIButton) {
        isSecureTextEntry = !isSecureTextEntry
        let image = isSecureTextEntry ? UIImage(named:"eye_open") : UIImage(named:"eye_closed")
        rightButton.setImage(image , for: .normal)
    }
    
    open override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let newBounds = CGRect(x: (self.frame.size.width - 28) - 8, y: (self.frame.size.height - 28)/2, width: 28, height: 28)
        return newBounds
    }
}

extension MaskTextField: UITextFieldDelegate {
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return self.realDelegate?.textFieldShouldBeginEditing?(textField) ?? true
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        self.realDelegate?.textFieldDidBeginEditing?(textField)
    }
    
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return self.realDelegate?.textFieldShouldEndEditing?(textField) ?? true
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        self.realDelegate?.textFieldDidEndEditing?(textField)
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let previousMask = self.stringMask
        
        errorLabel.isHidden = true
        
        let currentText: NSString = textField.text as NSString? ?? ""
        
        if let realDelegate = self.realDelegate, realDelegate.responds(to: #selector(textField(_:shouldChangeCharactersIn:replacementString:))), !callShouldChangeCharactersInAfterVerification {
            let delegateResponse = realDelegate.textField!(textField, shouldChangeCharactersIn: range, replacementString: string)
            
            if !delegateResponse {
                return false
            }
        }
        
        guard let mask = self.stringMask else { return true }
        
        let newText = currentText.replacingCharacters(in: range, with: string)
        var formattedString = mask.mask(string: newText)
        
        // if the mask changed or if the text couldn't be formatted,
        // unmask the newText and mask it again
        if (previousMask != nil && mask != previousMask!) || formattedString == nil {
            let unmaskedString = mask.unmask(string: newText)
            formattedString = mask.mask(string: unmaskedString)
        }
        
        guard let finalText = formattedString as NSString? else { return false }
        
        // if the cursor is not at the end and the string hasn't changed
        // it means the user tried to delete a mask character, so we'll
        // change the range to include the character right before it
        if finalText == currentText && range.location < currentText.length && range.location > 0 {
            return self.textField(textField, shouldChangeCharactersIn: NSRange(location: range.location - 1, length: range.length + 1) , replacementString: string)
        }
        
        if finalText != currentText {
            textField.text = finalText as String
            
            // the user is trying to delete something so we need to
            // move the cursor accordingly
            if range.location < currentText.length {
                var cursorLocation = 0

                var newText = textField.text.orEmpty


                if range.location > finalText.length {
                    cursorLocation = finalText.length
                } else if !newText.isEmpty && newText[newText.count - 1] == " " {
                    if newText.count > 3, let removeIndex = newText.index(newText.startIndex,
                                                                          offsetBy: newText.count - 1,
                                                                          limitedBy: newText.endIndex) {
                        newText.remove(at: removeIndex)
                        textField.text = newText
                    }
                    
                    cursorLocation = range.location - 1
                } else if !newText.isEmpty && newText[newText.count - 1] == "/" {
                    if newText.count > 3, let removeIndex = newText.index(newText.startIndex,
                                                                          offsetBy: newText.count - 1,
                                                                          limitedBy: newText.endIndex) {
                        newText.remove(at: removeIndex)
                        textField.text = newText
                }
                                   
                   cursorLocation = range.location - 1
                } else if currentText.length > finalText.length {
                    cursorLocation = range.location
                } else {
                    cursorLocation = range.location + 1
                }
                
                guard let startPosition = textField.position(from: textField.beginningOfDocument, offset: cursorLocation) else {
                    if callShouldChangeCharactersInAfterVerification {
                        _ = realDelegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string)
                    }
                    return false
                }
                guard let endPosition = textField.position(from: startPosition, offset: 0) else {
                    if callShouldChangeCharactersInAfterVerification {
                        _ = realDelegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string)
                    }
                    return false
                }
                textField.selectedTextRange = textField.textRange(from: startPosition, to: endPosition)
            }
            
            if callShouldChangeCharactersInAfterVerification {
                _ = realDelegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string)
            }
            return false
        }
        
        if callShouldChangeCharactersInAfterVerification {
            _ = realDelegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string)
        }
        return true
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return self.realDelegate?.textFieldShouldClear?(textField) ?? true
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return self.realDelegate?.textFieldShouldReturn?(textField) ?? true
    }
}
