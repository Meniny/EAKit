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

/// See `Sample/HEX.html`
enum HexColors: String {
    case rgb = "#f0f"
    case argb = "#ffcc"
    case rrggbb = "#00ff00"
    case aarrggbb = "#0000ffcc"
    
    var attrString: NSAttributedString {
        let color = Color.init(hexString: self.rawValue)
        
        return NSAttributedString.init(string: self.rawValue, attributes: [
            NSAttributedStringKey.backgroundColor: color!,
            NSAttributedStringKey.foregroundColor: color!.complementary!
            ])
    }
}

class ViewController: UIViewController {
    
    var timer: Timer?

    @IBOutlet weak var bottomLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = CSSColor.aqua.color
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { (_) in
            self.view.backgroundColor = UIColor.random
        })
        
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
        
        let npa = NATOPhoneticAlphabet.allAlphabets
        print(npa.map({ $0.rawValue }))
        print(npa.map({ $0.englishPhoneticAlphabet }))
        
        let attrString = NSMutableAttributedString.init(string: "")
        [HexColors.rgb, HexColors.argb, HexColors.rrggbb, HexColors.aarrggbb].forEach { (mode) in
            attrString.append(mode.attrString)
        }
        self.bottomLabel.attributedText = attrString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

