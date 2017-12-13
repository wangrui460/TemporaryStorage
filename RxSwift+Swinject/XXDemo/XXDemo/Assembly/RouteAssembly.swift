//
//  RouteAssembly.swift
//  XXDemo
//
//  Created by itwangrui on 2017/12/12.
//  Copyright © 2017年 itwangrui. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Swinject
import XiangxCore


// 不同的 Assembly 对应的 container 不一样
// 所以 resolve 同一个服务，不同的 container 返回的值可能不一样
class RouteAssembly: Assembly
{
    func assemble(container: Container)
    {
        print("2. RouteAssembly文件 register RouteSideEffectExecutor.self")
        container.register(RouteSideEffectExecutor.self) { r in
            return RouteSideEffectExecutor(container: container)
        }
        .inObjectScope(.container)
        .initCompleted { r, executor in
            
            print("5. RouteAssembly文件 resolve Observable<ToLogin>.self")
            // TODO: 这里的 executor.execute 方法参数是？
            _ = r.resolve(Observable<ToLogin>.self)!
                .observeOn(MainScheduler.asyncInstance)
                .asDriver { error in
                    Driver.empty()
                }
                .drive(onNext: executor.execute)
        }
    }
}
