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
    
    let test = AuthField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.
        test.inputType = .password
        
        self.view.addSubview(test)
        test.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            test.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
            test.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20),
            test.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            test.heightAnchor.constraint(equalToConstant: 50)

        ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

