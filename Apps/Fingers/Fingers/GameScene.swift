//
//  GameScene.swift
//  Fingers
//
//  Created by Parker Thomas on 10/23/17.
//  Copyright © 2017 Parker Thomas. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    private var circleNode: SKShapeNode?
    
    public var numberOfPlayers: Int?
    public var gameMode: String?
    
    var touchNodes = [UITouch:SKShapeNode]()
    
    let colors = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow, UIColor.orange]
    
    override func didMove(to view: SKView) {
        //define width of circle based on screen size
        let w = (self.size.width + self.size.height) * 0.12
        
        // create circle
        circleNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w / 2.0)
        
        //set circle properties
        circleNode?.lineWidth = 15.0
        circleNode?.isAntialiased = true
        
        // fill circles?
        //circleNode?.fillColor = UIColor.cyan
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // loop through touches, make circles
        for touch in touches {
            createCircleForTouch(touch: touch)
        }
        
        print(numberOfPlayers)
        print(gameMode)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            // get circle associated with touch
            if let circle = touchNodes[touch] {
                // move to new location
                let newLocation = touch.location(in: self)
                circle.position = newLocation
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            removeCircleForTouch(touch: touch)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            removeCircleForTouch(touch: touch)
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func createCircleForTouch(touch: UITouch) {
        // copy a cirlce, set properties, add to scene
        if let n = self.circleNode?.copy() as! SKShapeNode? {
            n.position = touch.location(in: self)
            n.strokeColor = pickFirstColorNotInUse()
            self.addChild(n)
            
            // associate touch and circle
            touchNodes[touch] = n
        }
    }
    
    func removeCircleForTouch(touch: UITouch) {
        // find the touch remove the circle
        if let circle = touchNodes[touch] {
            circle.removeFromParent() // remove from scene
            touchNodes.removeValue(forKey: touch) // remove from array
        }
    }
    
    func pickFirstColorNotInUse() -> UIColor {
        for color in colors {
            var colorInUse = false
            for touch in touchNodes {
                if touch.value.strokeColor == color {
                    colorInUse = true
                }
            }
            if !colorInUse {
                return color
            }
        }
        
        return UIColor.brown
    }
}

