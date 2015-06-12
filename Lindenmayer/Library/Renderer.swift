//
//  Renderer.swift
//  Lindenmayer
//
//  Created by Pedro Gomes on 04/06/2015.
//  Copyright (c) 2015 Pedro Gomes. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
protocol Renderer {
    
    func moveTo(point: CGPoint);
    
    func lineTo(point: CGPoint);
    
    func render();
    
    func origin() -> CGPoint;
}
