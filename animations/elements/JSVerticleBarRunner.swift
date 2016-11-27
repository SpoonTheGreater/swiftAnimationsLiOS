//
//  JSVerticleBarRunner.swift
//  animations
//
//  Created by James Sadlier on 27/11/2016.
//  Copyright © 2016 James Sadlier. All rights reserved.
//

import Foundation
import QuartzCore
import UIKit

class JSVerticleBarRunner: CALayer {
    
    override init(layer: Any) {
        super.init()
        self.frame = (layer as AnyObject).frame
        self.opacity = (layer as AnyObject).opacity
        self.backgroundColor = (layer as AnyObject).backgroundColor
        self.cornerRadius = frame.size.width * 0.5
        self.masksToBounds = true

    }
    
    init( frame: CGRect, color :UIColor)
    {
        super.init()
        self.frame = frame
        self.opacity = 1
        self.backgroundColor = color.cgColor
        self.cornerRadius = frame.size.width * 0.5
        self.masksToBounds = true
    }
    
    override init() {
        super.init()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
