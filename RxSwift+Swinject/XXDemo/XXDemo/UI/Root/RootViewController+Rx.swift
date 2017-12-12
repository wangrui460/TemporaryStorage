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
    return container
}

