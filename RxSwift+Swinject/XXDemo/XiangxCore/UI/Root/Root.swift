//
//  RootPage.swift
//  XiangxCore
//
//  Created by itwangrui on 2017/12/11.
//

import Foundation
import RxSwift

class RootPage
{
    let pageDidAppearEvent: Observable<Void>
    
    init(pageDidAppearEvent: Observable<Void>) {
        self.pageDidAppearEvent = pageDidAppearEvent
    }
}


func root_pageDidAppearEvent(_ uiEvent:Observable<UiEvent>) -> Observable<Void> {
    return uiEvent.flatMap{ e -> Observable<Void> in
        // TODO: 这里返回 Observable.just(Void()) 和 返回 Observable.empty() 有什么区别
        print("e.page = \(e.page)")
        print("e.action = \(e.action)")
        if case .some(Page.root) = e.page,
            case PageAction.pageDidAppear = e.action
        {
           return Observable.just(Void())
        }
        return Observable.empty()
    }
}


// http://swift.gg/2015/11/20/advanced-practical-enum-examples/
//    case .Some(xxx) 的用法
//    var changshaProgrammer: Double? = 10000000 //长沙市序猿总数
//
//    switch changshaProgrammer {
//    case 0?: print("长沙市木有程序猿类")
//    case (1..<1000)?: print("长沙市程序猿类竟然不到1000人")
//    case .Some(let x): print("长沙市有 \(x)程序猿类")
//    case .None: print("我们不知道长沙市有多少程序猿类")
//    }


