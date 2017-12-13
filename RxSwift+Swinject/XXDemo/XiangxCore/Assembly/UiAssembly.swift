//
//  UiAssembly.swift
//  XiangxCore
//
//  Created by itwangrui on 2017/12/11.
//

import Foundation
import Swinject
import RxSwift

public class UiAssembly: Assembly  //（Assembly是协议）
{
    public init() {
        
    }
    
    // Assembly 工厂方法，必须实现
    public func assemble(container: Container)
    {
        container.register(PublishSubject<UiEvent>.self) { r in
            PublishSubject<UiEvent>()
        }
        .inObjectScope(.container)

        container.register(Observable<UiEvent>.self) { r in
            r.resolve(PublishSubject<UiEvent>.self)!
        }
        .inObjectScope(.container)
        
        container.register(RootPage.self){ r in
//            let uiEvent = container.resolve(PublishSubject<UiEvent>.self)!
            let uiEvent = container.resolve(Observable<UiEvent>.self)!
            let pageDidAppearEvent = root_pageDidAppearEvent(uiEvent)
            return RootPage(pageDidAppearEvent: pageDidAppearEvent)
        }
        .inObjectScope(.container)
    }
}
