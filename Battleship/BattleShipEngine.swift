//
//  BattleShipEngine.swift
//  Battleship
//
//  Created by Eashir Arafat on 9/18/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class BattleShipEngine {
    let numCards: Int
    
    init(numCards:Int){
        self.numCards = numCards
        setupCards()
    }
    
    fileprivate enum State{
        case hit
        case miss
    }

    private  var cards = [State]()
    
    func setupCards(){
        cards = Array(repeating: .miss, count: numCards)
        cards[Int(arc4random_uniform(UInt32(numCards)))] = .hit
        
    }
    
    func checkCard(_ cardIn: Int) -> Bool{
        assert(cardIn < cards.count)  //helps with debugging
        return cards[cardIn] == .hit
    }
    
      
}
