//
//  ViewController.swift
//  iOS
//
//  Created by 李二狗 on 2018/2/1.
//  Copyright © 2018年 Meniny Lab. All rights reserved.
//

import UIKit
import EAKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.aqua
        
        EALog.error("error", self)
        EALog.dump("dump", self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

