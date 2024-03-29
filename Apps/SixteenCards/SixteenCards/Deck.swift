//
//  Deck.swift
//  SixteenCards
//
//  Created by Parker Thomas on 9/27/17.
//  Copyright © 2017 Parker Thomas. All rights reserved.
//

import Foundation

let values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king", "ace"]
let suits = ["spades", "clubs", "hearts", "diamonds"]

class Deck {
    
    //: Properties
    var deck: [Card] = []
    var inUse: [Bool] = []
    
    init() {
        for value in values {
            for suit in suits {
                deck.append(Card(value, suit))
                inUse.append(false)
            }
        }
    }
    
    // Pick and return random card from deck
    func dealRandomCard() -> Card {
        var which = 0
        
        repeat {
            which = Int(arc4random_uniform(UInt32(deck.count)))
        } while inUse[which]
        
        inUse[which] = true
        return deck[which]
    }
    
}
