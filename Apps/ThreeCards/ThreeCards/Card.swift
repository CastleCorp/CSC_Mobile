//
//  Card.swift
//  ThreeCards
//
//  Created by Parker Thomas on 9/22/17.
//  Copyright © 2017 Joel Hollingsworth. All rights reserved.
//

import Foundation
import UIKit

class Card {
    
    var value: String
    var suit: String
    
    enum CardState {
        case up
        case down
    }
    
    var state: CardState = .down
    
    var upImage: UIImage
    var downImage: UIImage
    
    var text: String
    
    init(_ value: String, _ suit: String) {
        self.value = value
        self.suit = suit
        
        text = "\(value) of \(suit)"
        
        upImage = UIImage(named: "\(value)_of_\(suit)")!
        downImage = #imageLiteral(resourceName: "back_of_card")
    }
    
}
