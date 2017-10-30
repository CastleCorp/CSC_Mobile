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
    var touchTeams = [UITouch:Int]()
    var randomTouch: UITouch?
    var teamOne = [UITouch]()
    var teamTwo = [UITouch]()
    
    var gv: GameViewController?
    
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
        if(numberOfPlayers == touchNodes.count) {
            let initialTime = Date()
            while(numberOfPlayers == touchNodes.count) {
                let newTime = Date()
                if(newTime.timeIntervalSince(initialTime) >= 2) {
                    if(gameMode == "pick one") {
                        pickOne()
                    }
                    if(gameMode == "make teams") {
                        makeTeams()
                    }
                }
            }
        }
        
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
    
    func pickOne() {
        let n = Int(arc4random_uniform(UInt32(touchNodes.count)))
        let index = touchNodes.index(touchNodes.startIndex, offsetBy: n)
        let randomTouch = touchNodes[index]
        for touch in touchNodes {
            if touch.key != randomTouch.key {
                removeCircleForTouch(touch: touch.key)
            }
        }
        randomTouch.value.strokeColor = UIColor.cyan
        print("Selected touch: \(randomTouch.key)")
    }
    
    func makeTeams() {
        var isEven: Bool = false
        var teamOneSize = 0
        var teamTwoSize = 0
        if(touchNodes.count % 2 == 0) {
            isEven = true
        }
        
        if(isEven) {
            teamOneSize = touchNodes.count / 2
            teamTwoSize = touchNodes.count / 2
        } else {
            teamOneSize = (touchNodes.count - 1) / 2
            teamTwoSize = teamOneSize + 1
        }
        
        var assigned = [UITouch]()
        
        for _ in 0..<teamOneSize {
            let n = Int(arc4random_uniform(UInt32(touchNodes.count)))
            let index = touchNodes.index(touchNodes.startIndex, offsetBy: n)
            let randomTouch = touchNodes[index]
            
            if(!assigned.contains(randomTouch.key)) {
                teamOne.append(randomTouch.key)
                assigned.append(randomTouch.key)
                randomTouch.value.strokeColor = UIColor.orange
            }
        }
        
        for _ in 0..<teamTwoSize {
            let n = Int(arc4random_uniform(UInt32(touchNodes.count)))
            let index = touchNodes.index(touchNodes.startIndex, offsetBy: n)
            let randomTouch = touchNodes[index]
            
            if(!assigned.contains(randomTouch.key)) {
                teamTwo.append(randomTouch.key)
                assigned.append(randomTouch.key)
                randomTouch.value.strokeColor = UIColor.cyan
            }
        }
        
    }
    
    func finished() {
        let initialTime = Date()
        while(true) {
            let newTime = Date()
            if(newTime.timeIntervalSince(initialTime) >= 5) {
                //remove game scene
                self.removeFromParent()
                self.view?.presentScene(nil)
                gv?.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    // timestamp - currentTime
}

