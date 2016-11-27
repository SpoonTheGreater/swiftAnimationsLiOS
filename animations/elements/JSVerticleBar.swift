//
//  JSVerticleBar.swift
//  animations
//
//  Created by James Sadlier on 27/11/2016.
//  Copyright © 2016 James Sadlier. All rights reserved.
//

import Foundation
import QuartzCore
import UIKit

class JSVerticleBar: CALayer {
    
    var isAnimating : Bool
    var runner : JSVerticleBarRunner

    init( frame: CGRect, color :UIColor)
    {
        isAnimating = false
        let runnerWidth : Double = Double(frame.width) * 8
        let halfWidth : Double = Double(frame.width) * 0.5
        let runnerX : Double = -(Double(runnerWidth) * 0.5) + halfWidth
        let runnerFrame : CGRect = CGRect(x: runnerX ,y: 0, width:runnerWidth,height:runnerWidth)
        runner = JSVerticleBarRunner(frame: runnerFrame, color: color)
        super.init()
        self.frame = frame
        self.opacity = 1
        self.backgroundColor = color.cgColor
        self.addSublayer(runner)
    }
    
    override init() {
        isAnimating = false
        runner = JSVerticleBarRunner()
        super.init()
        self.frame = CGRect(x: 0.0, y: 0.0, width: 2, height: UIScreen.main.bounds.height )
        self.opacity = 1
        self.addSublayer(runner)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func startAnimating( ) {
        if( isAnimating ){
            return
        }
        isAnimating = true
        let animation = CABasicAnimation(keyPath: "position")
        let startPoint = CGPoint (x: runner.position.x, y: runner.position.y )

        animation.fromValue = NSValue (cgPoint : startPoint)//NSValue( cgRect : startingFrame )

        let endPoint = CGPoint(x: runner.position.x, y: self.frame.size.height)
        //animation.byValue = NSValue (cgPoint : endPoint)
        animation.toValue = NSValue (cgPoint : endPoint) //NSValue( cgRect : completionFrame )
        //animation.toValue = startPoint
        animation.autoreverses = true
        animation.duration = 3
        animation.repeatCount = 100
        runner.position = endPoint
        
        runner.add(animation, forKey: "position")
        
    }
    
    public func stopAnimating( ) {
        if( !isAnimating ){
            return
        }
        isAnimating = false
        runner.removeAllAnimations()
    }
    
    public func toggleAnimation() {
        if ( isAnimating )
        {
            stopAnimating()
        } else {
            startAnimating()
        }
    }
    
}
