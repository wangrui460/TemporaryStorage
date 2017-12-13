//
//  RootViewController+Rx.swift
//  XXDemo
//
//  Created by itwangrui on 2017/12/12.
//  Copyright © 2017年 itwangrui. All rights reserved.
//

import Foundation
import RxSwift
import Swinject
import XiangxCore


func rootViewControllerContainer(parent: Container) -> Container {
    let container = Container(parent: parent)
    container.register(RootView.self) { _ in
        RootView()
    }
    container.register(PageType.self) { _ in
        Page.root
    }
    return container
}

extension RootViewController
{
    var events:Observable<UiEvent> {
        let container = self.container
        // public var rx: Reactive<Self>
        return self.rx.pageActions.map{ action in
            print("调用 uiEvent(of:,in:) 方法   action=\(action.name)")
            return uiEvent(of: action, in: container)
        }
    }
}




