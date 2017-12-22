//
//  UiAssembly.swift
//  XXDemo
//
//  Created by itwangrui on 2017/12/12.
//  Copyright © 2017年 itwangrui. All rights reserved.
//

import Foundation
import Swinject
import RxSwift
import XiangxCore

// 不同的 Assembly 对应的 container 不一样
// 所以 resolve 同一个服务，不同的 container 返回的值可能不一样
class UiAssembly: Assembly
{
    func assemble(container: Container)
    {
        // TODO: 没有调用 .inObjectScope(.container) 就有问题，那么默认 scope 是？
        container.register(UINavigationController.self) { r in
            UINavigationController(rootViewController: r.resolve(RootViewController.self)!)
        }
        .inObjectScope(.container)
        
        container.register(RootViewController.self) { r in
            RootViewController(container: rootViewControllerContainer(parent: container))
        }
        .initCompleted { r, rootViewController in
            let observer = r.resolve(PublishSubject<UiEvent>.self)!
            // subscribe<O>(_ observer: O)
            _ = rootViewController.events.subscribe(observer)
        }
        
        
        container.register(LoginViewController.self) { (r, toLogin:ToLogin) in
            LoginViewController(container:loginViewControllerContainer(parent: container))
        }
        
    }
}
