//
//  ViewController.swift
//  ColorApp
//
//  Created by Тадевос Курдоглян on 11.07.2021.
//

import UIKit

//protocol ColorViewControllerDelegate {
//    func setNewColor(for redColor: Float, for greenColor: Float, and blueColor: Float)
//}

class SettingsViewController: UIViewController {
    @IBOutlet weak var viewColor: UIView!
   
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    var delegate: SettingsViewControllerDelegate!
    
    var redValue: Float!
    var greenValue: Float!
    var blueValue: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewColor.layer.cornerRadius = 15
        
        sliderRed.value = redValue
        sliderGreen.value = greenValue
        sliderBlue.value = blueValue
        
        sliderRed.minimumTrackTintColor = .red
        sliderGreen.minimumTrackTintColor = .green
        
        updateSliderText()
        updateColorView()
        
    }
    

    @IBAction func sliderAction() {
        updateSliderText()
        updateColorView()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let colorVC = segue.source as? ColorViewController else { return }
//        colorVC
//    }
    
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
    
    @IBAction func doneTapped(_ sender: Any) {
        delegate.setNewColor(for: CGFloat(sliderRed.value), for: CGFloat(sliderGreen.value), and: CGFloat(sliderBlue.value))
        dismiss(animated: true)
    }
    
}

//extension SettingsViewController: ColorViewControllerDelegate {
//    func setNewColor(for redColor: Float, for greenColor: Float, and blueColor: Float) {
//        sliderRed.value = redColor
//        sliderGreen.value = greenColor
//        sliderBlue.value = blueColor
//    }
    
    

