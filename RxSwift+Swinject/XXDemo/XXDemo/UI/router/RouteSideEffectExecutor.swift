//
//  RouteSideEffectExecutor.swift
//  XXDemo
//
//  Created by itwangrui on 2017/12/12.
//  Copyright © 2017年 itwangrui. All rights reserved.
//

import Foundation
import Swinject
import XiangxCore


enum ViewControllerTransitionMethod {
    case push
    case present
    case replaceAll
}

struct ViewControllerTransition<DestinationViewController: UIViewController> {
    let method: ViewControllerTransitionMethod
    let animated: Bool
    let destinationViewController: DestinationViewController.Type
}

protocol ViewControllerTransitionConvertible {
    // 通过 associatedtype 关键字来指定关联类型
    associatedtype DestinationViewController: UIViewController
    func asViewControllerTransition() -> ViewControllerTransition<DestinationViewController>
}


class RouteSideEffectExecutor
{
    private let container:Container
    
    init(container:Container) {
        self.container = container
    }
    
    func execute<Effect>(sideEffect: Effect) where Effect:RouteSideEffectType, Effect:ViewControllerTransitionConvertible
    {
        let nav = container.resolve(UINavigationController.self)!
        let transition = sideEffect.asViewControllerTransition()
        let vc = container.resolve(transition.destinationViewController, argument: sideEffect)!
        let method = transition.method
        let animated = transition.animated
        
        switch method {
            case .push:
                nav.pushViewController(vc, animated: animated)
            case .present:
                nav.present(vc, animated: animated, completion: nil)
            case .replaceAll:
                nav.setViewControllers([vc], animated: animated)
        }
    }
}










