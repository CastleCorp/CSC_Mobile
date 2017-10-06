//
//  Card.swift
//  SixteenCards
//
//  Created by Parker Thomas on 9/27/17.
//  Copyright © 2017 Parker Thomas. All rights reserved.
//

import Foundation
import UIKit

class Card {
    
    //: Properties
    var value: String
    var suit: String
    
    enum CardState {
        case up
        case down
        case matched
    }
    
    var state = CardState.down
    
    var upImage: UIImage
    var downImage = #imageLiteral(resourceName: "back_of_card")
    
    var text: String
    
    // initializer
    init(_ value: String, _ suit: String) {
        self.value = value
        self.suit = suit
        
        upImage = UIImage(named: "\(value)_of_\(suit)")!
        
        text = "\(value) of \(suit)"
    }
    
    // get the current image
    func getCurrentImage() -> UIImage {
        if state == .up {
            return upImage
        }
        return downImage
    }
    
    // flip the card state, does not update image
    func flip() {
        if state == .down {
            state = .up
        } else {
            state = .down
        }
    }
    
    func isMatched() -> Bool {
        if state == .matched {
            return true
        }
        return false
    }
}
