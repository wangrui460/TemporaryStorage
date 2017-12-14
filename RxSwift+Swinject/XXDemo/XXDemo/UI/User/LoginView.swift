//
//  LoginView.swift
//  XXDemo
//
//  Created by itwangrui on 2017/12/14.
//  Copyright © 2017年 itwangrui. All rights reserved.
//

import UIKit
import Stevia
import Swinject

class LoginView: UIView
{
    let container:Container
    
    var phoneTextField: UITextField!
    var phoneValidationLabel: UILabel!
    var passwordTextField: UITextField!
    var passwordValidationLabel: UILabel!
    var submitButton: UIButton!
    var loginActivityIndictor: UIActivityIndicatorView!
    
    init(container:Container) {
        self.container = container
        super.init(frame: CGRect.zero)
        render()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        
        backgroundColor = .white
//        phoneTextField = UITextField(frame: CGRect.zero)
//        phoneValidationLabel = UILabel()
//        passwordTextField = UITextField(frame: CGRect.zero)
//        passwordValidationLabel = UILabel()
//        submitButton = UIButton(type: .system)
//        loginActivityIndictor = UIActivityIndicatorView(activityIndicatorStyle: .gray)
//        
//        sv(
//            phoneTextField.placeholder("phone"),
//            phoneValidationLabel,
//            passwordTextField.placeholder("password"),
//            passwordValidationLabel,
//            submitButton.text("Log in"),
//            loginActivityIndictor
//        )
//        
//        layout(
//            100,
//            |-phoneTextField-| ~ 80,
//            8,
//            |-phoneValidationLabel-|,
//            8,
//            |-passwordTextField-| ~ 80,
//            8,
//            |-passwordValidationLabel-|,
//            >=20,
//            
//            |-loginActivityIndictor-| ~ 80,
//            8,
//            |submitButton| ~ 80,
//            0
//        )
    }

    deinit {
        
    }
    
}
