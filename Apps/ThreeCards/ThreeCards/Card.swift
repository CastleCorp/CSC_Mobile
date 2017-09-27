//
//  Card.swift
//  ThreeCards
//
//  Created by Joel Hollingsworth on 9/25/17.
//  Copyright © 2017 Joel Hollingsworth. All rights reserved.
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
    }
    
    var state = CardState.up
    
    var upImage: UIImage
    var downImage = #imageLiteral(resourceName: "back_of_card")
    
    var text: String
    
    // initializer for the class
    init(_ value: String, _ suit: String) {
        self.value = value
        self.suit = suit
        
        upImage = UIImage(named: "\(value)_of_\(suit)")!
        
        text = "\(value) of \(suit)"
    }
    
    // the current image based on the card state
    func getCurrentImage() -> UIImage {
        if state == .up {
            return upImage
        }
        
        return downImage
    }
}
