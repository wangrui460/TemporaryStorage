//
//  LoginViewController.swift
//  XXDemo
//
//  Created by itwangrui on 2017/12/12.
//  Copyright © 2017年 itwangrui. All rights reserved.
//

import UIKit
import Swinject

class LoginViewController: UIViewController {

    let container: Container
    
    init(container: Container) {
        self.container = container
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func loadView() {
//
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Login"
    }

    

}
