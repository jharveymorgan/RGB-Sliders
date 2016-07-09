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
    
    // reference to square to show shade of picker
    @IBOutlet weak var colorSquare: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // load saved values from UserDefaults
        let defaults = NSUserDefaults.standardUserDefaults()
        redSlider.value = defaults.floatForKey("red")
        greenSlider.value = defaults.floatForKey("green")
        blueSlider.value = defaults.floatForKey("blue")
        
        // update square color when the view loads
        updateBackgroundColor()
        
        // make square visible by adding a border
        colorSquare.layer.borderColor = UIColor.blackColor().CGColor
        colorSquare.layer.borderWidth = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // comment to learn about git/version control

    // update square color when slider values are changed
    @IBAction func updateBackgroundColor() {
        
        // color values from slider
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        // set square color based on values of slider
        // alpha = 1 for background to be completely opaque
        colorSquare.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        // save last color
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setFloat(redSlider.value, forKey: "red")
        defaults.setFloat(greenSlider.value, forKey: "green")
        defaults.setFloat(blueSlider.value, forKey: "blue")
        // to make sure the values are saved immediately
        defaults.synchronize()
    }
    
    // function whenever a segue is about to happen
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "openColor") {
            // reference to second view controller
            let newViewController = segue.destinationViewController
            // change second view controller background color to color of the square
            newViewController.view.backgroundColor = colorSquare.backgroundColor
        }
    }
    
    // reset slider values to 0 when reset button is tapped
    @IBAction func resetButton() {
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
        
        // update square color with new values
        updateBackgroundColor()
    }
    
}

