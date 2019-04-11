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
    case rgba = "#ffcc"
//    case argb = "#cffc"
    case rrggbb = "#00ff00"
    case aarrggbb = "#FFFF8697"
    case rrggbbaa = "#FF8697FF"
    
    var mode: Color.HexadecimalNotationMode {
        switch self {
        case .rgb:      return .rgb
        case .rgba:     return .rgba
        case .rrggbb:   return .rrggbb
        case .aarrggbb: return .aarrggbb
        case .rrggbbaa: return .rrggbbaa
        }
    }
    
    var color: UIColor? {
        return Color.init(hexString: self.rawValue, mode: self.mode)!
    }
    
    var attrString: NSAttributedString {
        return NSAttributedString.init(string: self.rawValue, attributes: [
            NSAttributedString.Key.backgroundColor: self.color!,
            NSAttributedString.Key.foregroundColor: self.color!.complementary!
            ])
    }
}

struct Post: Codable {
    let title: String
    let url: String
}

struct Posts: Codable {
    let posts: [Post]
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
        
        let modes = [HexColors.rgb, HexColors.rgba, HexColors.rrggbb, HexColors.aarrggbb, HexColors.rrggbbaa]
        let attrString = NSMutableAttributedString.init(string: "")
        modes.forEach { (mode) in
            attrString.append(mode.attrString)
        }
        self.bottomLabel.attributedText = attrString
        
        let colors = modes.map { mode -> [String: String] in
            let c = mode.color!
            return [mode.rawValue: c.hexRepresentation(mode: mode.mode)]
        }
        print(colors)

        let url = URL.init(string: "https://meniny.cn/api/v2/posts.json")
        
        url?.get(as: Posts.self, completion: { (posts) in
            print(posts?.posts.count ?? 0)
        })
        
        url?.get(serializer: CodableDataSerializer<Posts>(), completion: { (posts) in
            print(posts?.posts.count ?? 0)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

