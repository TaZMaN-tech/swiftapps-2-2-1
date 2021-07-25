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
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    
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
        
        updateSliderLabels()
        updateTextField()
        updateColorView()
        
        addDoneButtonTo(redTextField)
        addDoneButtonTo(greenTextField)
        addDoneButtonTo(blueTextField)
        
    }
    

    @IBAction func sliderAction(_ sender: UISlider) {
        
        switch sender.tag {
        case 0:
            redLabel.text = getString(from: sender)
            redTextField.text = getString(from: sender)
        case 1:
            greenLabel.text = getString(from: sender)
            greenTextField.text = getString(from: sender)
        case 2:
            blueLabel.text = getString(from: sender)
            blueTextField.text = getString(from: sender)
        default:
            break
        }
        
        updateColorView()
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        delegate.setNewColor(for: CGFloat(sliderRed.value), for: CGFloat(sliderGreen.value), and: CGFloat(sliderBlue.value))
        dismiss(animated: true)
    }
    
    @IBAction func textFieldEndEdittng(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            
            switch textField.tag {
            case 0: sliderRed.value = currentValue
            case 1: sliderGreen.value = currentValue
            case 2: sliderBlue.value = currentValue
            default: break
            }
            
            updateColorView()
            updateSliderLabels()
        } else {
            showAlert(title: "Wrong format!", message: "Please enter correct value")
        }
    }
    
    private func updateSliderLabels() {
        redLabel.text = getString(from: sliderRed)
        greenLabel.text = getString(from: sliderGreen)
        blueLabel.text = getString(from: sliderBlue)
    }
    
    private func updateTextField() {
        redTextField.text = getString(from: sliderRed)
        greenTextField.text = getString(from: sliderGreen)
        blueTextField.text = getString(from: sliderBlue)
    }
    
    private func getString(from slider: UISlider) -> String {
        return String(format: "%.2f", slider.value)
    }
    
    private func updateColorView() {
        let red = CGFloat(sliderRed.value)
        let green = CGFloat(sliderGreen.value)
        let blue = CGFloat(sliderBlue.value)
        
        viewColor.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}


extension SettingsViewController {
    
    private func addDoneButtonTo(_ textField: UITextField) {
        
        let numberToolbar = UIToolbar()
        textField.inputAccessoryView = numberToolbar
        numberToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title:"Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapDone))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        
        numberToolbar.items = [flexBarButton, doneButton]
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


