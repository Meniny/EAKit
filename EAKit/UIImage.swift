//
//  UIImage.swift
//  EAKit
//
//  Blog  : https://meniny.cn
//  Github: https://github.com/Meniny
//
//  Created by Elias Abel on 2017/12/28.
//  Copyright © 2017年 Meniny Lab. All rights reserved.
//

#if os(iOS)
    import Foundation
    import UIKit

    public extension UIImage {
        
        public var hasContent: Bool {
            return cgImage != nil || ciImage != nil
        }
        
        public var original: UIImage? {
            guard hasContent else {
                return nil
            }
            
            return withRenderingMode(.alwaysOriginal)
        }
        
        public var template: UIImage? {
            guard hasContent else {
                return nil
            }
            
            return withRenderingMode(.alwaysTemplate)
        }
    }
#endif
