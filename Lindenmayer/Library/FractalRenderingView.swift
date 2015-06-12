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
    
    var path:  UIBezierPath
    let drawLayer: CAShapeLayer
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    override init(frame: CGRect) {

        self.path  = UIBezierPath()
        self.path.lineWidth = 1.0
        
        self.drawLayer = CAShapeLayer()
        self.drawLayer.path = self.path.CGPath
        self.drawLayer.strokeColor = UIColor(red: 39.0/255.0, green: 133.0/255.0, blue: 252.0/255.0, alpha: 1.0).CGColor
        self.drawLayer.lineWidth = 1.0
        self.drawLayer.fillColor = UIColor.clearColor().CGColor
        
        super.init(frame: frame)

        self.layer.addSublayer(self.drawLayer)
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
        CATransaction.setDisableActions(true)
        self.drawLayer.path = self.path.CGPath
        self.drawLayer.strokeStart = 0.0
        self.drawLayer.strokeEnd = 0.0
        CATransaction.setDisableActions(false)

        let path = CABasicAnimation(keyPath: "path")
        let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")

        strokeStartAnimation.fromValue = 0.0
        strokeEndAnimation.toValue = 1.0

        let group = CAAnimationGroup()
        group.animations = [path, strokeStartAnimation, strokeEndAnimation]
        group.duration = 2.0
        group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        group.fillMode = kCAFillModeBoth
        group.removedOnCompletion = false
        
        self.drawLayer.addAnimation(group, forKey: "AnimateStroke")
    }

    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    func origin() -> CGPoint {
        return self.center
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
//    override func drawRect(rect: CGRect) {
//        UIColor(red: 39.0/255.0, green: 133.0/255.0, blue: 252.0/255.0, alpha: 1.0).setStroke()
//        self.path.stroke()
//    }
    
    // MARK: CAAnimationDelegate
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        
    }
}