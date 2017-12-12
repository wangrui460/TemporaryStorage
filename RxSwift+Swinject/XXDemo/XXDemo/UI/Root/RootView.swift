//
//  RootView.swift
//  XXDemo
//
//  Created by itwangrui on 2017/12/12.
//  Copyright © 2017年 itwangrui. All rights reserved.
//

import UIKit

class RootView: UIView {
    
    convenience init() {
        self.init(frame:CGRect.zero)
        render()
    }
    
    func render() {
        backgroundColor = .orange
    }
}
