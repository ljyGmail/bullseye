//
//  ViewController.swift
//  Bullseye
//
//  Created by 양금용 on 8/25/24.
//

import UIKit

class ViewController: UIViewController {
  
  var currentValue: Int = 0
  
  var targetValue = 0
  
  @IBOutlet var slider: UISlider!
  
  @IBOutlet var targetLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    print("view did load")
    startNewRound()
  }
  
  @IBAction func showAlert() {
    let message = "The value of the slider is: \(currentValue)" +
      "\nThe target value is: \(targetValue)"
    
    let alert = UIAlertController(title: "Hello, World", message: message, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    
    startNewRound()
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    currentValue = lroundf(slider.value)
  }
  
  func startNewRound() {
    targetValue = Int.random(in: 1...100)
    currentValue = 50
    slider.value = Float(currentValue)
    updateLabels()
  }
  
  func updateLabels() {
    targetLabel.text = String(targetValue)
  }
}

