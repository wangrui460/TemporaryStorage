//
//  AppDelegate.swift
//  XXDemo
//
//  Created by itwangrui on 2017/12/5.
//  Copyright © 2017年 itwangrui. All rights reserved.
//

import UIKit
import Swinject
import XiangxCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let assembler:Assembler = appAssembler()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window
        window.rootViewController = assembler.resolver.resolve(UINavigationController.self)
        
        return true
    }
}

func appAssembler() -> Assembler {
    let assembler = Assembler([
        UiAssembly(),
//        XiangxCore.UiAssembly()
        ])
    return assembler
}

