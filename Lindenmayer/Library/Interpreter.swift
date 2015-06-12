//
//  Interpreter.swift
//  Lindenmayer
//
//  Created by Pedro Gomes on 04/06/2015.
//  Copyright (c) 2015 Pedro Gomes. All rights reserved.
//

import UIKit
import Foundation

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
class Interpreter {

    let renderer: Renderer
    var stack: [(CGPoint, CGPoint)] = []

    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    init(renderer: Renderer) {
        self.renderer = renderer
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    func run(definition: RenderingDefinition) {

        let rads     = Float((definition.angle * M_PI / 180))
        var position = self.renderer.origin()
        var vector   = CGPointMake(0, 1)
        var stack: [(CGPoint, CGPoint)] = []
        
        self.renderer.moveTo(position)
        
        for command in definition.commands {
            switch command {
                case .Forward:
                    position = CGPointMake(
                        position.x + vector.x * CGFloat(definition.step),
                        position.y + vector.y * CGFloat(definition.step))
                    self.renderer.lineTo(position)
                    self.renderer.render()
                
                case .TurnRight:
                    vector = turn(rads, faceX: Float(vector.x), faceY: Float(vector.y))
                
                case .TurnLeft:
                    vector = turn(-rads, faceX: Float(vector.x), faceY: Float(vector.y))
                
                case .PushStack:
                    stack.insert((position, vector), atIndex: 0)
                
                case .PopStack:
                    (position, vector) = stack[0]
                    stack.removeAtIndex(0)
                    self.renderer.moveTo(position)
            }
        }
        self.renderer.render()
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    private func turn(angle: Float, faceX: Float, faceY: Float) -> CGPoint {
        return CGPointMake(
            CGFloat(faceX * cos(angle) - faceY * sin(angle)),
            CGFloat(faceY * cos(angle) + faceX * sin(angle)))
    }
}
