//
//  ViewController.swift
//  DicesBoard
//
//  Created by Kostadin Samardzhiev on 21.12.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var leftDiceImageView: UIImageView!
    @IBOutlet weak var rightDiceImageView: UIImageView!
    @IBOutlet weak var upDiceImageView: UIImageView!
    @IBOutlet weak var downDiceImageView: UIImageView!

    @IBOutlet weak var dicesNumberSegment: UISegmentedControl!
    let diceImagesArray: [UIImage?] = [
        UIImage(named: "DiceOne"),
        UIImage(named: "DiceTwo"),
        UIImage(named: "DiceThree"),
        UIImage(named: "DiceFour"),
        UIImage(named: "DiceFive"),
        UIImage(named: "DiceSix"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        becomeFirstResponder()
        dicesNumberSegment.selectedSegmentIndex = 1
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
//        UINotificationFeedbackGenerator().notificationOccurred(.error)
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            rollDices()
        }
    }

    @IBAction func rollActionButton(_ sender: UIButton) {
        print("Button pressed")
        rollDices()
    }
    
    @IBAction func diceNumberSegment(_ sender: UISegmentedControl) {
        print("Segment change")
        switch(sender.selectedSegmentIndex) {
        case 0:
            leftDiceImageView.isHidden = false
            rightDiceImageView.isHidden = true
            upDiceImageView.isHidden = true
            downDiceImageView.isHidden = true
        case 1:
            leftDiceImageView.isHidden = false
            rightDiceImageView.isHidden = false
            upDiceImageView.isHidden = true
            downDiceImageView.isHidden = true
        case 2:
            leftDiceImageView.isHidden = false
            rightDiceImageView.isHidden = false
            upDiceImageView.isHidden = false
            downDiceImageView.isHidden = true
        case 3:
            leftDiceImageView.isHidden = false
            rightDiceImageView.isHidden = false
            upDiceImageView.isHidden = false
            downDiceImageView.isHidden = false
        default:
            print("Invalid segment value")
        }
    }
    
    func rollDices() {
        UINotificationFeedbackGenerator().notificationOccurred(.error)
        leftDiceImageView.image = diceImagesArray.randomElement()!
        rightDiceImageView.image = diceImagesArray.randomElement()!
        upDiceImageView.image = diceImagesArray.randomElement()!
        downDiceImageView.image = diceImagesArray.randomElement()!
    }
    
    
    
}

