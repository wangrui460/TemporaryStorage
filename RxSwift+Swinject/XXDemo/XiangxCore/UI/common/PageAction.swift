//
//  PageAction.swift
//  XiangxCore
//
//  Created by itwangrui on 2017/12/12.
//

import Foundation


public enum PageAction: String, ActionType {
    case pageLoad
    case pageWillAppear
    case pageDidAppear
    case pageWillDisappear
    case pageDidDisappear
}
