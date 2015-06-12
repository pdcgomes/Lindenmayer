//
//  Parser.swift
//  Lindenmayer
//
//  Created by Pedro Gomes on 04/06/2015.
//  Copyright (c) 2015 Pedro Gomes. All rights reserved.
//

import Foundation

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
class Parser {

    var string      = ""
    var rules: [String: String] = [:]
    var step        = 10
    var iterations  = 1
    var angle: Double = 90
 
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    init(spec: [String: AnyObject]) {
        self.string     = spec["String"]        as? String ?? ""
        self.rules      = spec["Rules"]         as? [String: String] ?? [:]
        self.step       = spec["Step"]          as? Int ?? 10
        self.iterations = spec["Iterations"]    as? Int ?? 1
        self.angle      = spec["Angle"]         as? Double ?? 90
    }

    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    func parse() -> RenderingDefinition {
        let expandedString  = performSubstitutions(self.string)
        let commandList     = buildCommandListFromInstructions(expandedString)
        
        return RenderingDefinition(
            commands: commandList,
            step: self.step,
            iterations: self.iterations,
            angle: self.angle)
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    private func performSubstitutions(string: String) -> String {
        var expansion = string
        
        for _ in 1...self.iterations {
            expansion = expand(expansion)
        }
        return expansion
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    private func expand(string: String) -> String {
        var expansion: String = ""
        for char in string.characters {
            expansion += self.rules[String(char)] ?? String(char)
        }
        return expansion
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    private func buildCommandListFromInstructions(string: String) -> [Command] {
        var commandList = [Command]()
        
        for char in string.characters {
            if let command = Command(rawValue: String(char)) {
                commandList.append(command)
            }
        }
        return commandList
    }
}