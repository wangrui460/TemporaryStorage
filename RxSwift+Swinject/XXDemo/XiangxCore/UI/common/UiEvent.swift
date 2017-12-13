//
//  UiEvent.swift
//  XiangxCore
//
//  Created by itwangrui on 2017/12/11.
//

import Foundation


// TODO:这里为什么用 struct

public struct UiEvent:UiEventType {
    public let page: PageType?
    public let section: SectionType?
    public let component: ComponentType?
    public let action: ActionType
    public init(page:PageType?, section:SectionType?, component:ComponentType?, action:ActionType) {
        self.page = page
        self.section = section
        self.component = component
        self.action = action
    }
}
