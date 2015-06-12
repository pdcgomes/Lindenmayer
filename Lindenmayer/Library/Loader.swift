//
//  Loader.swift
//  Lindenmayer
//
//  Created by Pedro Gomes on 04/06/2015.
//  Copyright (c) 2015 Pedro Gomes. All rights reserved.
//

import Foundation

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
class Loader {
    
    let file: NSURL
    
    init(file: NSURL) {
        self.file = file
    }
    
    func load() throws -> [NSObject: AnyObject]? {
        try self.file.checkResourceIsReachable()

        if let dict = NSDictionary(contentsOfURL: self.file) as? [NSObject: AnyObject] {
            return dict
        }
        return nil
    }
}