//
//  MatchGameModel.swift
//  SixteenCards
//
//  Created by Parker Thomas on 9/27/17.
//  Copyright © 2017 Parker Thomas. All rights reserved.
//

import Foundation
import UIKit

class MatchGameModel {
    
    //: Properties
    let deck = Deck()
    var hand: [Card] = []
    var lastCardFlipped: Card!
    
    init() {
        for _ in 1...52 {
            hand.append(deck.dealRandomCard())
        }
    }
    
    // Get image from the card in the hand
    func getCardImage(_ which: Int) -> UIImage {
        return hand[which].getCurrentImage()
    }
    
    func flipCard(_ which: Int) {
        hand[which].flip()
        lastCardFlipped = hand[which]
    }
    
    func getLastCardFlipped() -> Card {
        return lastCardFlipped
    }
    
}
