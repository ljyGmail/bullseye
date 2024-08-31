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
  var score = 0
  var round = 0
  
  @IBOutlet var slider: UISlider!
  @IBOutlet var targetLabel: UILabel!
  @IBOutlet var scoreLabel: UILabel!
  @IBOutlet var roundLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    print("view did load")
    startNewRound()
  }
  
  @IBAction func showAlert() {
    
    /* First algorithm
    var difference: Int
    
    if currentValue > targetValue {
      difference = currentValue - targetValue
    } else if targetValue > currentValue {
      difference = targetValue - currentValue
    } else {
      difference = 0
    }
     */
    
    /* Second algorithm
    var difference = currentValue - targetValue
    
    if difference < 0 {
      difference *= -1
    }
     */
    
    // Another variation
    let difference = abs(targetValue - currentValue)
    let points = 100 - difference
    score += points
    
    let message = "You scored \(points) points"
    
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
    round += 1
    targetValue = Int.random(in: 1...100)
    currentValue = 50
    slider.value = Float(currentValue)
    updateLabels()
  }
  
  func updateLabels() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }
}

