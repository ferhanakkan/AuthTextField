//
//  AuthField.swift
//  AuthTextField
//
//  Created by Ferhan Akkan on 22.07.2020.
//

//password icin resim ekle ve autosize ver bi sekilde
//custom edilebilir yap
//fontlari ekle

import UIKit

public enum InputTypeSelection {
    case email
    case password
    case name
    case surname
    case phone
    case custom
}

public enum AnimationTypeSelection {
    case shake
    case flash
    case pulse
    case none
}

public class AuthField: UIView {
    
    private let textField = UITextField()
    private let label = UILabel()
    private let borderView = UIView()
    private var showPasswordButton: UIButton?
    private var isPasswordVisiable = false
    private var labelFontSmall: UIFont = .systemFont(ofSize: 12) 
    private var labelFontLarge: UIFont = .boldSystemFont(ofSize: 15) {
        didSet {
            label.font = labelFontLarge
        }
    }
    
    public var inputType: InputTypeSelection? {
        didSet {
            setView()
        }
    }
    
    private var eyeImage: UIImage? = UIImage(named: "eye", in: Bundle(for: AuthField.self), compatibleWith: nil)
    
    private var eyeHiddenImage: UIImage? = UIImage(named: "eyeHidden", in: Bundle(for: AuthField.self), compatibleWith: nil)
    
    public var isOptional = false //Preset false
    public var animationType: AnimationTypeSelection = .shake  //Preset Shake
    public var noticeBorderColor: UIColor = .red // Preset Red Border Color
    public var textColor: UIColor = .lightGray {
        didSet {
            borderView.layer.borderColor = textColor.cgColor
            label.textColor = textColor
        }
    }// Preset Light Gray Color for text
    public var inputColor: UIColor = .lightGray {
        didSet {
            textField.textColor = inputColor
        }
    }// Preset Light Gray Color for Textfield input
    
    private lazy var centerConstraint = label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
    private lazy var topConstraint = label.centerYAnchor.constraint(equalTo: self.topAnchor)
    
}

//MARK: - Set View

extension AuthField {
    
    private func setView() {
        textField.delegate = self
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        borderView.translatesAutoresizingMaskIntoConstraints = false
        
        setTextField()
    }
    
    private func setTextField() {
        
        self.addSubview(borderView)
        borderView.addSubview(textField)
        
        borderView.layer.borderColor = textColor.cgColor
        borderView.layer.borderWidth = 1
        borderView.layer.cornerRadius = 15
        
        
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: self.topAnchor),
            borderView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            borderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        self.addSubview(label)
        label.textColor = .lightGray
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
        ])
        
        if inputType == InputTypeSelection.password {
            
            showPasswordButton = UIButton(type: .system)
            borderView.addSubview(showPasswordButton!)

            label.text = "Password"
            
            textField.textContentType = .password
            textField.isSecureTextEntry = true
            
            
            showPasswordButton!.setBackgroundImage(eyeHiddenImage, for: .normal)
            showPasswordButton!.addTarget(self, action: #selector(eyeButtonPressed), for: .touchUpInside)
            showPasswordButton?.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([

                showPasswordButton!.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -5),
                showPasswordButton!.centerYAnchor.constraint(equalTo: borderView.centerYAnchor),
                showPasswordButton!.widthAnchor.constraint(equalToConstant: 30),
                showPasswordButton!.heightAnchor.constraint(equalToConstant: 30),
            ])
            
            NSLayoutConstraint.activate([
                textField.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -5),
                textField.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 10),
                textField.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 5),
                textField.trailingAnchor.constraint(equalTo: self.showPasswordButton!.leadingAnchor, constant: -5)
            ])
                    
        } else {
            
            NSLayoutConstraint.activate([
                textField.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -5),
                textField.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 10),
                textField.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 5),
                textField.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -10)
            ])

            switch inputType {
            case .name:
                label.text = "Name"
                self.textField.keyboardType = .namePhonePad
            case .surname:
                label.text = "Surname"
                self.textField.keyboardType = .namePhonePad
            case .email:
                label.text = "E-Mail"
                self.textField.keyboardType = .emailAddress
            case .phone:
                label.text = "Phone"
                self.textField.textContentType = .telephoneNumber
            default:
                return
            }
            
        }
    }
}

//MARK: - Button Actions

extension AuthField {
    
    @objc func eyeButtonPressed() {
        isPasswordVisiable = !isPasswordVisiable
        if isPasswordVisiable {
            showPasswordButton!.setBackgroundImage(eyeImage, for: .normal)
            textField.isSecureTextEntry = false
        } else {
            showPasswordButton!.setBackgroundImage(eyeHiddenImage, for: .normal)
            textField.isSecureTextEntry = true
        }
    }
}

//MARK: - TextField Delegate

extension AuthField: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        expansionView(isOpen: true)
    }
    
    public func textFieldDidChangeSelection(_ textField: UITextField) {
        if isOptional {
            borderView.layer.borderColor = textColor.cgColor
            self.label.textColor = textColor
        } else if textField.text!.isEmpty {
            borderView.layer.borderColor = noticeBorderColor.cgColor
            self.label.textColor = noticeBorderColor
        } else {
            borderView.layer.borderColor = textColor.cgColor
            self.label.textColor = textColor
        }
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        expansionView(isOpen: false)
        
        if isOptional {
            borderView.layer.borderColor = textColor.cgColor
            self.label.textColor = textColor
        } else if !checkField() {
            borderView.layer.borderColor = noticeBorderColor.cgColor
            self.label.textColor = noticeBorderColor
        } else {
            borderView.layer.borderColor = textColor.cgColor
            self.label.textColor = textColor
        }
    }
    
}


//MARK: - Animation

extension AuthField {
    
    private func showAnimation() {
        
        switch animationType {
        case .flash:
            let animation = CABasicAnimation(keyPath: "opacity")
            animation.duration = 0.5
            animation.fromValue = 1
            animation.toValue = 0.1
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            animation.autoreverses = true
            animation.repeatCount = 3
            layer.add(animation, forKey: "flash")        case .pulse:
            let animation = CASpringAnimation(keyPath: "transform.scale")
            animation.duration = 0.6
            animation.fromValue = 0.95
            animation.toValue = 1
            animation.autoreverses = true
            animation.repeatCount = 2
            animation.initialVelocity = 0.5
            layer.add(animation, forKey: "pulse")
        case .shake:
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
            layer.add(animation, forKey: "position")
        case .none:
            return
        }
    }
    
    private func expansionView(isOpen: Bool) {
        if isOpen {
            label.backgroundColor = .white
            label.font = labelFontSmall
            
            centerConstraint.isActive = false
            topConstraint.isActive = true
            
            UIView.animate(withDuration: 1, animations: {
                self.layoutIfNeeded()
            }) { (_) in
                
            }
        } else {
            if textField.text!.isEmpty {
                label.backgroundColor = .clear
                label.font = labelFontLarge
                centerConstraint.isActive = true
                  topConstraint.isActive = false
                UIView.animate(withDuration: 1, animations: {
                    self.layoutIfNeeded()
                }) { (_) in
                    print("Animation Completed!!!")
                }
            }
        }
        
    }
}

//MARK: - Validation

extension AuthField {
    
    func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
    
    public func checkField() -> Bool {
        
        if isOptional {
            return true
        } else {
            switch inputType {
            case .name:
                textField.text!.count > 3 ? nil : showAnimation()
                return textField.text!.count > 3
            case .surname:
                textField.text!.count > 3 ? nil : showAnimation()
                return textField.text!.count > 3
            case .email:
                textField.text!.count > 3 ? nil : showAnimation()
                validateEmail(enteredEmail: textField.text!) ? nil : showAnimation()
                return validateEmail(enteredEmail: textField.text!)
            case .password:
                textField.text!.count > 3 ? nil : showAnimation()
                return textField.text!.count > 3
            case .none:
                textField.text!.count > 3 ? nil : showAnimation()
                return textField.text!.count > 3
            case .phone:
                textField.text!.count > 5 ? nil : showAnimation()
                return textField.text!.count > 5
            case .custom:
                textField.text!.count > 3 ? nil : showAnimation()
                return textField.text!.count > 3
            }
        }
    }
    
}

//MARK: - Custom Textfield

extension AuthField {
    
    public func setCustomAuthField(isOptional: Bool, animationType: AnimationTypeSelection, noticeColor: UIColor, textColor: UIColor, textfieldInputColor: UIColor, textFieldInputFont: UIFont, titleLabelSmallSizeFont: UIFont, titleLabelLargeSizeFont: UIFont) {
        
        self.inputType = .custom
        self.isOptional = isOptional
        self.animationType = animationType
        self.noticeBorderColor = noticeColor
        self.textColor = textColor
        self.textField.textColor = textfieldInputColor
        self.textField.font = textFieldInputFont
        self.labelFontSmall = titleLabelSmallSizeFont
        self.labelFontLarge = titleLabelLargeSizeFont
    }
    
}

