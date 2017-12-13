//
//  Router.swift
//  XiangxCore
//
//  Created by itwangrui on 2017/12/12.
//

import Foundation
import RxSwift

public protocol RouteSideEffectType: SideEffectType {}

public struct ToLogin:RouteSideEffectType {}

func route_toLoginSideEffect(_ root_pageDidAppearEvent: Observable<Void>) -> Observable<ToLogin> {
    // public func map<R>(_ transform: @escaping (Self.E) throws -> R) -> RxSwift.Observable<R>
    return root_pageDidAppearEvent.map { _ in
        ToLogin()
    }
}
