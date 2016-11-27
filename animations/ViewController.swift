//
//  ViewController.swift
//  animations
//
//  Created by James Sadlier on 27/11/2016.
//  Copyright © 2016 James Sadlier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tapGestureRecogniser: UITapGestureRecognizer!
    var rightSlider : JSVerticleBar
    
    var sliders : NSMutableArray

    required init?(coder aDecoder: NSCoder) {
        rightSlider = JSVerticleBar(frame: CGRect(x: 200, y:20, width: 2,height : UIScreen.main.bounds.height - 40), color: UIColor(colorLiteralRed: 0.1, green: 1, blue: 0.1, alpha: 0.8) )
        
        let sliderCount : Int = Int(arc4random_uniform(30))
        var newBar : JSVerticleBar = JSVerticleBar(frame: CGRect(x: 10, y:20, width: 2,height : UIScreen.main.bounds.height - 40), color: UIColor(colorLiteralRed: 0.1, green: 1, blue: 0.1, alpha: 0.8) )
        sliders = NSMutableArray()
        //sliders.add(newBar)
        let sliderSpace : Double = Double(UIScreen.main.bounds.size.width) / Double(sliderCount-1)
        for i in 0 ... sliderCount {
            newBar = JSVerticleBar(frame: CGRect(x: CGFloat(i) * CGFloat(sliderSpace), y:20.0, width: 2.0,height : UIScreen.main.bounds.height - 40), color: UIColor(colorLiteralRed: Float(Int(arc4random_uniform(256)))/254.0, green: Float(Int(arc4random_uniform(256)))/254.0, blue: Float(Int(arc4random_uniform(256)))/254.0, alpha: 0.8) )
            sliders.add(newBar)
        }
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0, alpha: 1)
        // Do any additional setup after loading the view, typically from a nib.
        //self.view.layer.addSublayer(rightSlider)
        for slider in sliders
        {
            self.view.layer.addSublayer(slider as! CALayer)
            
            let deadlineTime = DispatchTime.now() + .seconds(Int(arc4random_uniform(5)))
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                (slider as! JSVerticleBar).toggleAnimation()
            }
        }
        tapGestureRecogniser.addTarget(self, action: #selector(respondToTap))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func respondToTap()  {
        rightSlider.toggleAnimation()
    }
}

