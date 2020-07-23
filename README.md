# AuthTextField

<p align="center">
<img src='https://github.com/ferhanakkan/AuthTextField/blob/master/Example/Pods/Resources/Assets.xcassets/logo.imageset/logo.png' width="200" />
</p>

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
## Author

ferhanakkan, ferhanakkan@gmail.com

## License

AuthTextField is available under the MIT license. See the LICENSE file for more info.
