//
//  EventUtil.swift
//  XXDemo
//
//  Created by itwangrui on 2017/12/12.
//  Copyright © 2017年 itwangrui. All rights reserved.
//

import Foundation
import Swinject
import XiangxCore


func uiEvent(of action: ActionType, in container:Container) -> UiEvent
{
    return UiEvent(
        page: container.resolve(PageType.self),
        section: container.resolve(SectionType.self),
        component: container.resolve(ComponentType.self),
        action: action
    )
}
