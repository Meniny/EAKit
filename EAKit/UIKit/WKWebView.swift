//
//  UIWebView.swift
//  EAKit-iOS
//
//  Created by Meniny on 2018-05-16.
//

#if os(iOS)
import Foundation
import UIKit
import WebKit

extension UIPrintPageRenderer {
    
    public func drawPDFData() -> Data {
        let pdfData = NSMutableData.init()
        UIGraphicsBeginPDFContextToData(pdfData, self.paperRect, nil)
        self.prepare(forDrawingPages: NSRange.init(location: 0, length: self.numberOfPages))
        
        let bounds = UIGraphicsGetPDFContextBounds()
        
        for i in 0..<self.numberOfPages {
            UIGraphicsBeginPDFPage()
            self.drawPage(at: i, in: bounds)
        }
        
        UIGraphicsEndPDFContext()
        return pdfData as Data
    }
}

extension WKWebView {
    public enum RenderType: String, Equatable, Codable {
        case pdf, png, jpg
    }
    
    public func render(as type: WKWebView.RenderType) -> Data? {
        switch type {
        case .pdf:
            return renderPDF()
        case .png, .jpg:
            guard let img = renderImage() else {
                return nil
            }
            if type == .png {
                return UIImagePNGRepresentation(img)
            }
            return UIImageJPEGRepresentation(img, 1)
        }
    }
    
    public static let pdfSize = CGSize.init(width: 595.2, height: 841.8)
    
    public func renderPDF() -> Data {
        let render = UIPrintPageRenderer.init()
        render.addPrintFormatter(self.viewPrintFormatter(), startingAtPageAt: 0)
        
        // Padding is desirable, but optional
        let padding: CGFloat = 10
        
        // Define the printableRect and paperRect
        // If the printableRect defines the printable area of the page
        let paperRect = CGRect.init(x: 0, y: 0,
                                    width: type(of: self).pdfSize.width,
                                    height: type(of: self).pdfSize.height)
        
        let printableRect = CGRect.init(x: padding, y: padding,
                                        width: type(of: self).pdfSize.width - padding * 2,
                                        height: type(of: self).pdfSize.height - padding * 2)
        
        render.setValue(paperRect, forKey: "paperRect")
        render.setValue(printableRect, forKey: "printableRect")
        
        // Call the printToPDF helper method that will do the actual PDF creation using values set above
        return render.drawPDFData()
    }
    
    public func renderImage() -> UIImage? {
        //Create original tmp bounds
        let originalFrame = self.frame
        var newFrame = self.bounds
        
        newFrame.size.width = self.frame.size.width
        newFrame.size.height = self.frame.size.height
        self.frame = newFrame
        
        let screen = UIScreen.main.bounds.size
        let fitSize = self.sizeThatFits(screen)
        
        newFrame.size.height = fitSize.height
        self.frame = newFrame
        
        UIGraphicsBeginImageContext(fitSize)
        
        guard let resizedContext = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        self.layer.render(in: resizedContext)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.frame = originalFrame
        
        return image
    }
}

#endif
