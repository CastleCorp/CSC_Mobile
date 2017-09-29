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
    var lastCardFlipped: Int = -1
    
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
    }
    
    func getLastCardFlipped() -> Int {
        return lastCardFlipped
    }
    
    
    func cardsMatch(_ whichFirstCard: Int, _ whichSecondCard: Int) -> (Bool, Bool) {
        let firstCard = hand[whichFirstCard]
        let secondCard = hand[whichSecondCard]
        
        if(firstCard.suit == secondCard.suit && firstCard.value == secondCard.value) {
            return (true, true)
        }
        
        if(firstCard.suit == secondCard.suit) {
            return (true, false)
        }
        
        if(firstCard.value == secondCard.value) {
            return (false, true)
        }
        return (false, false)
    }
    
    func getCardText(_ which: Int) -> String {
        return hand[which].text
    }
    
    func matchesRemaining() -> Bool {
        var remainingCards: [Card] = []
        for card in hand {
            if card.state == .down {
                remainingCards.append(card)
            }
        }
        for c1 in remainingCards {
            for c2 in remainingCards {
                if c1.suit == c2.suit || c1.value == c2.value {
                    return true
                }
            }
        }
        return false
    }
    
}
