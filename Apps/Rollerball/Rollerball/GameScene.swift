//
//  GameScene.swift
//  Rollerball
//
//  Created by Joel Hollingsworth on 11/7/16.
//  Copyright © 2016 Joel Hollingsworth. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    
    let ball = SKSpriteNode(imageNamed: "Ball")
    let motionManager = CMMotionManager()
    
    let ballSpeed: CGFloat = 15.0
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.blue
        ball.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        addChild(ball)
        
        motionManager.startAccelerometerUpdates()
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if let accelData = motionManager.accelerometerData {
            
            // compute the new location
            let newX = ball.position.x - CGFloat(accelData.acceleration.y) * ballSpeed
            let newY = ball.position.y + CGFloat(accelData.acceleration.x) * ballSpeed
            
            // set the new location
            ball.position.x = newX
            ball.position.y = newY
            
            // make sure the ball does not fall off the screen
            let halfWidth = ball.size.width / 2
            let halfHeight = ball.size.height / 2
            
            if ball.position.x < halfWidth {
                ball.position.x = halfWidth
            } else if ball.position.x + halfWidth > size.width {
                ball.position.x = size.width - halfWidth
            }
            
            if ball.position.y < halfHeight {
                ball.position.y = halfHeight
            } else if ball.position.y + halfHeight > size.height {
                ball.position.y = size.height - halfHeight
            }
        }
    }
}





