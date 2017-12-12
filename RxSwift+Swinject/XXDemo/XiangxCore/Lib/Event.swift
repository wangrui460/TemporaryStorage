//
//  Event.swift
//  XiangxCore
//
//  Created by itwangrui on 2017/12/11.
//

import Foundation

public protocol EventType {}

public protocol withName {
    // Property in protocol must have explicit { get } or { get set } specifier
    // 协议中的属性必须指定是 { get } 还是 { get set }
    var name:String { get }
}

public protocol PageType:withName {}
public protocol SectionType:withName {}
public protocol ComponentType:withName {}
public protocol ActionType:withName {}

public protocol UiEventType: EventType {
    // Property in protocol must have explicit { get } or { get set } specifier
    var page:PageType? { get }
    var section:SectionType? { get }
    var component:ComponentType? { get }
    var action:ActionType { get }
}


extension RawRepresentable where RawValue == String {
    public var name: String {
        return self.rawValue
    }
}

