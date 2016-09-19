//BLAH
//  FirstViewController.swift
//  Battleship
//
//  Created by Jason Gresh on 9/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var gameTiles: UIView!
    
    let howManyCards: Int
    
    let engine: BattleShipEngine
    var loaded: Bool
    let resetTitle = "Reset"
    let firstTenLetters = [ "A","B","C","D","E","F","G","H","I","J"]
    
    func fieldAnnotations(letterNum: Int, inputArray: [String]) -> String {
        let num = letterNum - 1 % 10
        for eachLetter in inputArray {
            
            return eachLetter + String(num)
            
           
        }
        return "blah"
    }

    //Initializes values for the ones above
    required init?(coder aDecoder: NSCoder) {
        self.howManyCards = 100
        self.loaded = false
        self.engine = BattleShipEngine(numCards: self.howManyCards)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func viewDidLayoutSubviews() {
        if !loaded {
            setUpGameButtons(v: gameTiles, totalButtons: self.howManyCards, buttonsPerRow: 10)
            self.view.setNeedsDisplay()
        }
        loaded = true
    }
    
    func resetButtonColors() {
        for v in gameTiles.subviews {
            if let button = v as? UIButton {
                button.backgroundColor = UIColor.blue
                button.isEnabled = true
            }
        }
    }
    
  
    
    func disableCardButtons() {
        for v in gameTiles.subviews {
            if let button = v as? UIButton {
                button.isEnabled = false
            }
        }
    }
    
    func buttonTapped(_ sender: UIButton) {
        gameLabel.text = sender.currentTitle
        
        if engine.checkCard(sender.tag - 1) {
            gameLabel.text = "Winner winner chicken dinner!"
            sender.backgroundColor = UIColor.green
            disableCardButtons()
            
            
        } else {
            gameLabel.text = "Nope! Guess again."
            sender.backgroundColor = UIColor.red
        }
    }
    
        func setUpGameLabel () {
        gameLabel.text = "Let's Play!"
    }
    
    func setUpGameButtons(v: UIView, totalButtons: Int, buttonsPerRow : Int) {
        for i in 1...howManyCards {
            let y = ((i - 1) / buttonsPerRow)
            let x = ((i - 1) % buttonsPerRow)
            let side : CGFloat = v.bounds.size.width / CGFloat(buttonsPerRow)
            
            let rect = CGRect(origin: CGPoint(x: side * CGFloat(x), y: (CGFloat(y) * side)), size: CGSize(width: side, height: side))
            let button = UIButton(frame: rect)
            button.tag = i
            button.backgroundColor = UIColor.blue
            
             let annotation = fieldAnnotations(letterNum: i,inputArray: firstTenLetters)
            button.setTitle( annotation, for: UIControlState())
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            v.addSubview(button)
        }
        
        setUpGameLabel()
    }

}

