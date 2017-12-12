//
//  RootViewController.swift
//  XXDemo
//
//  Created by itwangrui on 2017/12/12.
//  Copyright © 2017年 itwangrui. All rights reserved.
//

import UIKit
import Swinject

class RootViewController: UIViewController {

    let container: Container
    
    init(container:Container) {
        self.container = container
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = container.resolve(RootView.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "RootViewController"
    }


}
