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
        
        initializeSingleton(assembler.resolver)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window
        window.rootViewController = assembler.resolver.resolve(UINavigationController.self)
        
        return true
    }
}

func initializeSingleton(_ resolver: Resolver) {
    _ = resolver.resolve(RouteSideEffectExecutor.self)
}

// 不同的 Assembly 对应的 container 不一样
// 所以 resolve 同一个服务，不同的 container 返回的值可能不一样
func appAssembler() -> Assembler {
    let assembler = Assembler([
        UiAssembly(),
        RouteAssembly(),
        XiangxCore.UiAssembly(),
        XiangxCore.RouteAssembly()
        ])
    return assembler
}

