//
//  Spec.swift
//  Lindenmayer
//
//  Created by Pedro Gomes on 04/06/2015.
//  Copyright (c) 2015 Pedro Gomes. All rights reserved.
//

import Foundation

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
enum Command : String {
    case Forward    = "F"
    case TurnRight  = "+"
    case TurnLeft   = "-"
    case PushStack  = "["
    case PopStack   = "]"
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
struct RenderingDefinition  {
    
    let angle: Double
    let commands: [Command]
    let iterations: Int
    let step: Int

    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    init(commands: [Command], step: Int, iterations: Int, angle: Double) {
        self.angle      = angle
        self.commands   = commands
        self.iterations = iterations
        self.step       = step
    }
}


