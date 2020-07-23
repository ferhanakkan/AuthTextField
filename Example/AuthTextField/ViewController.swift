//
//  ViewController.swift
//  AuthTextField
//
//  Created by ferhanakkan on 07/22/2020.
//  Copyright (c) 2020 ferhanakkan. All rights reserved.
//


import UIKit
import AuthTextField

class ViewController: UIViewController {


    @IBOutlet weak var nameTextField: AuthField!
    @IBOutlet weak var surnameTextField: AuthField!
    @IBOutlet weak var phoneTextField: AuthField!
    @IBOutlet weak var emailTextField: AuthField!
    @IBOutlet weak var passwordTextField: AuthField!
    @IBOutlet weak var customTextField: AuthField!


    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.inputType = .name
        surnameTextField.inputType = .surname
        phoneTextField.inputType = .phone
        emailTextField.inputType = .email
        passwordTextField.inputType = .password

        customTextField.inputType = .custom
        customTextField.setCustomAuthField(isOptional: true, animationType: .flash, noticeColor: .blue, textColor: .orange, textfieldInputColor: .orange, textFieldInputFont: .boldSystemFont(ofSize: 15), titleLabelSmallSizeFont: .systemFont(ofSize: 12), titleLabelLargeSizeFont: .boldSystemFont(ofSize: 15), placeHolderText: "Custom", requiredMinCharacter: 5)

    }

    @IBAction func validateButton(_ sender: UIButton) {
        nameTextField.checkField()
        surnameTextField.checkField()
        phoneTextField.checkField()
        emailTextField.checkField()
        passwordTextField.checkField()
        customTextField.checkField()
    }
}


//let nameTextfield = AuthField()
//
//override func viewDidLoad() {
//    super.viewDidLoad()
//    nameTextfield.inputType = .name
//
//    self.view.addSubview(nameTextfield)
//    nameTextfield.translatesAutoresizingMaskIntoConstraints = false
//    NSLayoutConstraint.activate([
//        nameTextfield.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
//        nameTextfield.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20),
//        nameTextfield.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
//        nameTextfield.heightAnchor.constraint(equalToConstant: 50)
//
//    ])
//}

//
//class ViewController: UIViewController {
//
//
//    @IBOutlet weak var nameTextField: AuthField!
//    @IBOutlet weak var surnameTextField: AuthField!
//    @IBOutlet weak var phoneTextField: AuthField!
//    @IBOutlet weak var emailTextField: AuthField!
//    @IBOutlet weak var passwordTextField: AuthField!
//    @IBOutlet weak var customTextField: AuthField!
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        nameTextField.inputType = .name
//        surnameTextField.inputType = .surname
//        surnameTextField.animationType = .flash
//        phoneTextField.inputType = .phone
//        phoneTextField.animationType = .pulse
//        emailTextField.inputType = .email
//        passwordTextField.inputType = .password
//
//        customTextField.inputType = .custom
//        customTextField.setCustomAuthField(isOptional: true, animationType: .flash, noticeColor: .blue, textColor: .orange, textfieldInputColor: .orange, textFieldInputFont: .boldSystemFont(ofSize: 15), titleLabelSmallSizeFont: .systemFont(ofSize: 12), titleLabelLargeSizeFont: .boldSystemFont(ofSize: 15), placeHolderText: "Custom", requiredMinCharacter: 5)
//
//    }
//
//    @IBAction func validateButton(_ sender: UIButton) {
//        nameTextField.checkField()
//        surnameTextField.checkField()
//        phoneTextField.checkField()
//        emailTextField.checkField()
//        passwordTextField.checkField()
//        customTextField.checkField()
//    }
//}
