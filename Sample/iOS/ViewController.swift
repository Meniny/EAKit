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
        
        self.view.backgroundColor = CSSColor.aqua.color
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.view.backgroundColor = UIColor.random
        }
        
        EALog.error("error", self)
        EALog.dump("dump", self)
        
        var string = "This is a sample string."
        EALog.info("the memory address of 'string1' is: ", address(of: &string), separator: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

