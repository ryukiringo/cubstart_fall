//
//  ViewController.swift
//  Bullseye
//
//  Created by 柳澤琉貴 on 2022/09/28.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var numlabel: UILabel!
    @IBOutlet weak var numSlider: UISlider!
    @IBOutlet weak var exactSwitch: UISwitch!
    @IBOutlet weak var highScore: UILabel!
    @IBOutlet weak var currentLevel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var hintSwitch: UISwitch!
    
    var randomNumber: Int = 0
    var range: Int = 100
    var level: Int = 1
    var highScoreNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        randomNumber = Int(arc4random_uniform(101))
        numlabel.text = String(randomNumber)
        rangeLabel.text = String(range)
        currentLevel.text = String(level)
        highScore.text = String(highScoreNumber)
    }

    @IBAction func slideValueChaged() {
        //numlabel.text = "\(Int(numSlider.value))"
    }
    
    @IBAction func chackLabel() {
        if exactSwitch.isOn == false {
            if randomNumber - 3 <= Int(numSlider.value)&&randomNumber + 3 >= Int(numSlider.value){
                resultLabel.text = "You were right on point Bullseye!"
                range += 50
                rangeLabel.text = String(range)
                numSlider.maximumValue = Float(range)
                level += 1
                currentLevel.text = String(level)
                numSlider.setValue(Float(range / 2), animated: false)
                randomNumber = Int(arc4random_uniform(UInt32(range + 1)))
                numlabel.text = String(randomNumber)
                resultLabel.isHidden = true
                playAgainButton.isHidden = true
            } else {
                if hintSwitch.isOn == false {
                    playAgainButton.isHidden = false
                    resultLabel.text = "Whoops! You missed ! Try again later"
                } else {
                    playAgainButton.isHidden = false
                    resultLabel.text = "You were \(Int(numSlider.value) - Int(randomNumber)) away!"
                }
            }
        } else {
            if randomNumber == Int(numSlider.value) {
                resultLabel.text = "Bullseye!"
                range += 50
                rangeLabel.text = String(range)
                numSlider.maximumValue = Float(range)
                level += 1
                currentLevel.text = String(level)
                numSlider.setValue(Float(range / 2), animated: false)
                randomNumber = Int(arc4random_uniform(UInt32(range + 1)))
                numlabel.text = String(randomNumber)
                resultLabel.isHidden = true
                playAgainButton.isHidden = true
            } else {
                if hintSwitch.isOn == false {
                    playAgainButton.isHidden = false
                    resultLabel.text = "OMG! You missed it!"
                } else {
                    playAgainButton.isHidden = false
                    resultLabel.text = "You were \(Int(numSlider.value) - Int(randomNumber)) away!"
                }
            }
        }
        resultLabel.isHidden = false
    }
    
    @IBAction func playAgain() {
        currentLevel.text = String(level)
        if level > highScoreNumber {
            highScoreNumber = level
            highScore.text = String(highScoreNumber)
        } else if level == highScoreNumber {
            resultLabel.text = "You have to make more effort!"
        }
        randomNumber = Int(arc4random_uniform(101))
        numlabel.text = String(randomNumber)
        numSlider.setValue(50.0, animated: false)
        resultLabel.isHidden = true
        playAgainButton.isHidden = true
        range = 100
        rangeLabel.text = String(range)
        numSlider.maximumValue = Float(range)
        level = 1
        currentLevel.text = String(level)
    }

}

