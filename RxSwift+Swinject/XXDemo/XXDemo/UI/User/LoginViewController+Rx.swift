//
//  LoginViewController+Rx.swift
//  XXDemo
//
//  Created by itwangrui on 2017/12/13.
//  Copyright © 2017年 itwangrui. All rights reserved.
//

import Foundation
import Swinject
import RxSwift
import XiangxCore


func loginViewControllerContainer(parent: Container) -> Container
{
    let container = Container(parent: parent)
    container.register(PageType.self) { _ in
        Page.login
    }
    container.register(LoginView.self) { _ in
        LoginView(container: container)
    }
    
    return container
}
