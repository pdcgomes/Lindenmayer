//
//  ViewController.swift
//  Lindenmayer
//
//  Created by Pedro Gomes on 04/06/2015.
//  Copyright (c) 2015 Pedro Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var renderer: FractalRenderingView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))
        self.renderer = FractalRenderingView(frame: frame)
       
        self.view.addSubview(self.renderer!)
    }
    
    override func viewDidAppear(animated: Bool) {
 
        let parser = Parser(spec: [
            "String": "XF",
            "Rules": [
                "X": "X+YF+",
                "Y": "-FX-Y"],
            "Step": 3,
            "Angle": 90,
            "Iterations": 12
            ])
//        let parser = Parser(spec: [
//            "String": "XF",
//            "Rules": [
//                "X": "F-[[X]+X]+F[+FX]-X",
//                "F": "FF"],
//            "Step": 3,
//            "Angle": 25,
//            "Iterations": 8
//            ])
        
        let definition = parser.parse()

        let interpreter = Interpreter(renderer: self.renderer!)
        interpreter.run(definition)
        
        self.renderer?.render()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

