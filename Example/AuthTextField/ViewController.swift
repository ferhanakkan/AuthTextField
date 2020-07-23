//
//  ViewController.swift
//  AuthTextField
//
//  Created by ferhanakkan on 07/22/2020.
//  Copyright (c) 2020 ferhanakkan. All rights reserved.
//


//Programmatically usage

import UIKit
import AuthTextField

class ViewController: UIViewController {
    

    @IBOutlet weak var nameTextField: AuthField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.inputType = .name
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
