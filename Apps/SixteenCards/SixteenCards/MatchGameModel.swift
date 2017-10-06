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
    var deck = Deck()
    var hand: [Card] = []
    var remainingCards: [Card] = []
    var lastCardFlipped: Int = -1
    
    init() {
        for _ in 1...16 {
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
    
    func getCard(_ which: Int) -> Card {
        return hand[which]
    }
    
    func cardsMatch(_ whichFirstCard: Int, _ whichSecondCard: Int) -> (Bool, Bool) {
        let firstCard = hand[whichFirstCard]
        let secondCard = hand[whichSecondCard]
        
        if(firstCard.suit == secondCard.suit && firstCard.value == secondCard.value) {
            setMatched(whichFirstCard)
            setMatched(whichSecondCard)
            return (true, true)
        }
        
        if(firstCard.suit == secondCard.suit) {
            setMatched(whichFirstCard)
            setMatched(whichSecondCard)
            return (true, false)
        }
        
        if(firstCard.value == secondCard.value) {
            setMatched(whichFirstCard)
            setMatched(whichSecondCard)
            return (false, true)
        }
        return (false, false)
    }
    
    func getCardText(_ which: Int) -> String {
        return hand[which].text
    }
    
    func setMatched(_ which: Int) {
        hand[which].state = .matched
    }
    
    func matchesRemaining() -> Bool {
        for i in 0..<hand.count {
            if hand[i].state != .matched {
                remainingCards.append(hand[i])
            }
        }
        
        for j in 0..<remainingCards.count {
            let cardJ = remainingCards[j]
            for k in 0..<remainingCards.count {
                let cardK = remainingCards[k]
                if(j != k) {
                    if(cardJ.suit == cardK.suit || cardJ.value == cardK.value) {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    func restartGame() {
        deck = Deck()
        hand = []
        for _ in 1...16 {
            hand.append(deck.dealRandomCard())
        }
    }
}
