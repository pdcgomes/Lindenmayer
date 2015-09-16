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
    
    func load() throws -> [String: AnyObject]? {
        let error: NSErrorPointer = nil
        let success = self.file.checkResourceIsReachableAndReturnError(error)

        guard success == true else { return nil }
        
        if let templates = NSArray(contentsOfURL: self.file) as? [AnyObject] {
            return templates[2] as? [String: AnyObject]
        }
//        if let dict = NSDictionary(contentsOfURL: self.file) as? [String: AnyObject] {
//            return dict
//        }
        return nil
    }
}