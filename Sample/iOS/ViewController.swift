//
//  ViewController.swift
//  iOS
//
//  Created by 李二狗 on 2018/2/1.
//  Copyright © 2018年 Meniny Lab. All rights reserved.
//

import UIKit
import EAKit

struct Some: Codable {
    var title: String
    var message: String
}

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
        
        let some = Some.init(title: "Hello", message: "Hi there!")
        EALog.info(some.jsonify)
        
        let source: [[Int]] = [[1], [2, 3], [4], [5, 6]]
        let flattened: [Int] = source.flat()
        EALog.info(source, flattened)
        
        let numberWords = ["one", "two", "three"]
        for word in numberWords {
            print(word)
        }
        
        let map = numberWords.enumerate { (word, index, _) -> String in
            let new = "word " + word
            print(word, new, index)
            return new
        }
        print(map)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

