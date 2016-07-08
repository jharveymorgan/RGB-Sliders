//
//  ViewController.swift
//  RGB Sliders
//
//  Created by Jordan Harvey-Morgan on 7/7/16.
//  Copyright © 2016 Jordan Harvey-Morgan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // reference to red slider
    @IBOutlet weak var redSlider: UISlider!
    
    // reference to green slider
    @IBOutlet weak var greenSlider: UISlider!
    
    // reference to blue slider
    @IBOutlet weak var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // update background color when the view loads
        updateBackgroundColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // comment to learn about git/version control

    // update background color when slider values are changed
    @IBAction func updateBackgroundColor() {
        
        // color values from slider
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        // set backgound color based on values of slider
        // alpha = 1 for background to be completely opaque
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
}

