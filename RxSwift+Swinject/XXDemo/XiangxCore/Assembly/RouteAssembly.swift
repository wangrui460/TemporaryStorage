//
//  RouteAssembly.swift
//  Alamofire
//
//  Created by itwangrui on 2017/12/12.
//

import Foundation
import Swinject
import RxSwift


public class RouteAssembly: Assembly
{
    public init() {
        
    }
    
    public func assemble(container: Container) {
        
        print("3. XiangxCore RouteAssembly register Observable<ToLogin>.self")
        container.register(Observable<ToLogin>.self) { r in
            let rootPage = r.resolve(RootPage.self)!
            return route_toLoginSideEffect(rootPage.pageDidAppearEvent)
        }
        .inObjectScope(.container)
    }
}

