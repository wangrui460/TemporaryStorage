//
//  UIViewController+Rx.swift
//  XXDemo
//
//  Created by itwangrui on 2017/12/12.
//  Copyright © 2017年 itwangrui. All rights reserved.
//

import Foundation
import XiangxCore
import RxSwift
import RxCocoa

extension Reactive where Base: UIViewController
{
    var pageActions:Observable<PageAction> {
        return Observable.merge([
            self.methodInvoked(#selector(Base.viewDidLoad)).map{_ in .pageLoad},
            self.methodInvoked(#selector(Base.viewWillAppear)).map{_ in .pageWillAppear},
            self.methodInvoked(#selector(Base.viewDidAppear)).map{_ in .pageDidAppear},
            self.methodInvoked(#selector(Base.viewWillDisappear)).map{_ in .pageWillDisappear},
            self.methodInvoked(#selector(Base.viewDidDisappear)).map{_ in .pageDidDisappear},
            ]).asObservable()
    }
}
