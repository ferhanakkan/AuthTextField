# AuthTextField

<p align="center">
<img src='https://github.com/ferhanakkan/AuthTextField/blob/master/Example/Pods/Resources/Assets.xcassets/logo.imageset/logo.png' width="200" />
</p>

AuthTextField allows you to easily create and validate animated textfields on the authentication screens for your applications.

![gitHub](https://github.com/ferhanakkan/AuthTextField/blob/master/Example/Pods/Resources/Assets.xcassets/animation.dataset/animation.gif)

[![CI Status](https://img.shields.io/travis/ferhanakkan/AuthTextField.svg?style=flat)](https://travis-ci.org/ferhanakkan/AuthTextField)
[![Version](https://img.shields.io/cocoapods/v/AuthTextField.svg?style=flat)](https://cocoapods.org/pods/AuthTextField)
[![License](https://img.shields.io/cocoapods/l/AuthTextField.svg?style=flat)](https://cocoapods.org/pods/AuthTextField)
[![Platform](https://img.shields.io/cocoapods/p/AuthTextField.svg?style=flat)](https://cocoapods.org/pods/AuthTextField)

## Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Author](#author)
- [License](#license)

## Requirements
- iOS 12+
- Swift 5+
- Xcode 10+

## Installation

AuthTextField is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AuthTextField'
```

## Usage 

### Quick Start

#### Programmatically usage

```swift

import UIKit
import AuthTextField

class ViewController: UIViewController {
    
    let nameTextfield = AuthField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextfield.inputType = .name
        
        self.view.addSubview(nameTextfield)
        nameTextfield.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextfield.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
            nameTextfield.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20),
            nameTextfield.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextfield.heightAnchor.constraint(equalToConstant: 50)

        ])
    }

}
```
#### Storyboard Usage

Firstly insert UIView object in your view than enter in identitiy inspector and change inside Custom Class -> Class to AuthField. Connect your UIView to ViewController.swift file.

<p align="center">
<img src='https://github.com/ferhanakkan/AuthTextField/blob/master/Example/Pods/Resources/Assets.xcassets/identitiy.imageset/Screen%20Shot%202020-07-23%20at%2015.18.58.png' width="200" />
</p>

```swift

import UIKit
import AuthTextField

class ViewController: UIViewController {
    

    @IBOutlet weak var nameTextField: AuthField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.inputType = .name
    }
    
}
```

### Detail Usage

#### Preset Input Types

#### Animations 

```swift
import UIKit
import AuthTextField

class ViewController: UIViewController {
    
    @IBOutlet weak var firstTextField: AuthField!
    @IBOutlet weak var secondTextField: AuthField!
    @IBOutlet weak var thirdTextField: AuthField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTextField.inputType = .name
        secondTextField.inputType = .name
        thirdTextField.inputType = .name
        
        //Setting animation Preset animationType = .shake
        
        firstTextField.animationType = .shake
        secondTextField.animationType = .pulse
        thirdTextField.animationType = .flash
    }
    
    @IBAction func validateButtonPressed(_ sender: Any) {
        firstTextField.checkField()
        secondTextField.checkField()
        thirdTextField.checkField()
    }
    
}
```
#### Password

```swift 
import UIKit
import AuthTextField

class ViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: AuthField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.inputType = .password
    }
    
    @IBAction func validateButtonPressed(_ sender: Any) {
        passwordTextField.checkField()
    }
    
}
``` 
#### Email Validation

If input type selected e-mail when you gonna validate textfield it will be automatically check e-mail format.

class ViewController: UIViewController {
```swift 
import UIKit
import AuthTextField

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: AuthField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.inputType = .email
    }
    
    @IBAction func validateButtonPressed(_ sender: Any) {
        emailTextField.checkField()
    }
    
}
``` 

#### Create Custom AuthField

```swift
import UIKit
import AuthTextField

class ViewController: UIViewController {
    
    @IBOutlet weak var customFirstTextField: AuthField!
    @IBOutlet weak var customSecondTextField: AuthField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customFirstTextField.inputType = .custom
        customFirstTextField.setCustomAuthField(isOptional: true, animationType: .flash, noticeColor: .red, textColor: .lightGray, textfieldInputColor: .purple, textFieldInputFont: .systemFont(ofSize: 15), titleLabelSmallSizeFont: .systemFont(ofSize: 12), titleLabelLargeSizeFont: .boldSystemFont(ofSize: 15), placeHolderText: "Custom First Optional", requiredMinCharacter: 1)

        customSecondTextField.inputType = .custom
        customSecondTextField.setCustomAuthField(isOptional: false, animationType: .shake, noticeColor: .purple, textColor: .blue, textfieldInputColor: .blue, textFieldInputFont: .boldSystemFont(ofSize: 20), titleLabelSmallSizeFont: .systemFont(ofSize: 15), titleLabelLargeSizeFont: .boldSystemFont(ofSize: 20), placeHolderText: "Custom Second Non Optional", requiredMinCharacter: 3)
    }
    
    @IBAction func validateButtonPressed(_ sender: Any) {
        customFirstTextField.checkField()
        customSecondTextField.checkField()
    }
    
}

```

## Author

ferhanakkan, ferhanakkan@gmail.com

## License

AuthTextField is available under the MIT license. See the LICENSE file for more info.



