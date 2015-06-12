//
//  UIViewRenderer.swift
//  Lindenmayer
//
//  Created by Pedro Gomes on 11/06/2015.
//  Copyright © 2015 Pedro Gomes. All rights reserved.
//

import UIKit
import QuartzCore

//extension UIColor : RawRepresentable {
//    var rawValue: Int {
//        get {
//            return 1
//        }
//    }
//
//    init?(rawValue: Self.RawValue) {
//        
//    }
//}
//
//enum Colors : UIColor {
//    case BackgroundColor = UIColor(red: 57.0/255.0, green: 57.0/255.0, blue: 57.0/255.0, alpha: 1.0).rawValue
//}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
class FractalRenderingView : UIView, Renderer {
    
    let path:  UIBezierPath
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    override init(frame: CGRect) {

        self.path  = UIBezierPath()
        self.path.lineWidth = 1.0
        
        super.init(frame: frame)

        self.backgroundColor = UIColor(red: 57.0/255.0, green: 57.0/255.0, blue: 57.0/255.0, alpha: 1.0)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    func lineTo(point: CGPoint) {
//        print("lineTo(point:\(point)")
        self.path.addLineToPoint(point)
    }

    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    func moveTo(point: CGPoint) {
//        print("moveTo(point:\(point)")
        self.path.moveToPoint(point)
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    func render() {
        self.setNeedsDisplay()
    }

    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    func origin() -> CGPoint {
        return self.center
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    override func drawRect(rect: CGRect) {
        UIColor(red: 39.0/255.0, green: 133.0/255.0, blue: 252.0/255.0, alpha: 1.0).setStroke()
        self.path.stroke()
    }
}