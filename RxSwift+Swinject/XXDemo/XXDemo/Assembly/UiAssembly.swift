//
//  UiAssembly.swift
//  XXDemo
//
//  Created by itwangrui on 2017/12/12.
//  Copyright © 2017年 itwangrui. All rights reserved.
//

import Foundation
import Swinject

class UiAssembly: Assembly
{
    func assemble(container: Container)
    {
        
        container.register(RootViewController.self) { r in
            RootViewController(container: rootViewControllerContainer(parent: container))
        }
        
        container.register(UINavigationController.self) { r in
            UINavigationController(rootViewController: r.resolve(RootViewController.self)!)
        }
    }
}
