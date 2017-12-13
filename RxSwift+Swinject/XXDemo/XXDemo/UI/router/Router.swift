//
//  Router.swift
//  XXDemo
//
//  Created by itwangrui on 2017/12/12.
//  Copyright © 2017年 itwangrui. All rights reserved.
//

import Foundation
import XiangxCore

extension ToLogin: ViewControllerTransitionConvertible
{
    func asViewControllerTransition() -> ViewControllerTransition<LoginViewController> {
        return ViewControllerTransition(method: .present, animated: true, destinationViewController: LoginViewController.self)
    }
}
