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
    startNewGame()
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
    var points = 100 - difference
    
    let title: String
    if difference == 0 {
      title = "Perfect!"
      points += 100
    } else if difference < 5 {
      title = "You almost had it!"
      if difference == 1 {
        points += 50
      }
    } else if difference < 10 {
      title = "Pretty good!"
    } else {
      title = "Not even close..."
    }
    
    score += points
    
    let message = "You scored \(points) points"
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    /*
    let action = UIAlertAction(
      title: "OK",
      style: .default,
      handler: { _ in
        self.startNewRound()
      })
     */
    // syntactic sugar
    let action = UIAlertAction(
      title: "OK", 
      style: .default) { _ in
        self.startNewRound()
    }
    
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    currentValue = lroundf(slider.value)
  }
  
  @IBAction func startNewGame() {
    score = 0
    round = 0
    startNewRound()
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

