//
//  Deck.swift
//  ThreeCards
//
//  Created by Parker Thomas on 9/25/17.
//  Copyright © 2017 Joel Hollingsworth. All rights reserved.
//

import Foundation

let values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king", "ace"]
let suits = ["spades"]

class Deck {
    
    var deck: [Card] = []
    var inUse : [Bool] = []
    
    init() {
        for suit in suits {
            for value in values {
                deck.append(Card(value, suit))
                inUse.append(false)
            }
        }
    }
    
    func drawRandomCard() -> Card {
        var which = 0
        
        repeat {
            which = Int(arc4random_uniform(UInt32(deck.count)))
        } while inUse[which]
        
        inUse[which] = true
        return deck[which]
    }
    
}
