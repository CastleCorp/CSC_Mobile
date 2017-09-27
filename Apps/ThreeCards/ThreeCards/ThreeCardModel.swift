//
//  ThreeCardModel.swift
//  ThreeCards
//
//  Created by Joel Hollingsworth on 9/27/17.
//  Copyright © 2017 Joel Hollingsworth. All rights reserved.
//

import Foundation
import UIKit

class ThreeCardModel {
    let deck = Deck()
    var hand: [Card] = []

    init() {
        for _ in 1...3 {
            hand.append(deck.dealRandomCard())
        }
    }
    
    // Return the image from the card in the hand
    func getCardImage(_ which: Int) -> UIImage {
        return hand[which].getCurrentImage()
    }
}
