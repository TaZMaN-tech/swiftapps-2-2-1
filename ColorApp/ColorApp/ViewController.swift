//
//  ViewController.swift
//  ColorApp
//
//  Created by Тадевос Курдоглян on 11.07.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viewColor: UIView!
   
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewColor.layer.cornerRadius = 15
        
        sliderRed.value = 0.35
        sliderGreen.value = 0.55
        sliderBlue.value = 0.75
        
        updateSliderText()
        updateColorView()
    }
    

    @IBAction func sliderAction() {
        updateSliderText()
        updateColorView()
    }
    
    func updateSliderText() {
        redLabel.text = String(format: "%.2f", sliderRed.value)
        greenLabel.text = String(format: "%.2f", sliderGreen.value)
        blueLabel.text = String(format: "%.2f", sliderBlue.value)
    }
    
    func updateColorView() {
        let red = CGFloat(sliderRed.value)
        let green = CGFloat(sliderGreen.value)
        let blue = CGFloat(sliderBlue.value)
        
        viewColor.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

