//
//  Model.swift
//  ThreeCards
//
//  Created by Parker Thomas on 9/25/17.
//  Copyright © 2017 Joel Hollingsworth. All rights reserved.
//

import Foundation
import UIKit

class Model {
    
    let deck = Deck()
    
    var list: [Card] = []
    
    init() {
        // draw 3 random cards from the deck
        for _ in 1...3 {
            list.append(deck.drawRandomCard())
        }
    }
    
    func getCardImage(_ which: Int) -> UIImage {
        return list[which].getCurrentImage()
    }
    
    
    
}
