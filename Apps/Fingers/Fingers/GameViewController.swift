//
//  GameViewController.swift
//  Fingers
//
//  Created by Parker Thomas on 10/23/17.
//  Copyright © 2017 Parker Thomas. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
<<<<<<< HEAD
=======
    
    var viewController: ViewController?
>>>>>>> 1638a3f0e26efc69143777b9caee456bab5ea682

    override func viewDidLoad() {
        super.viewDidLoad()
        
<<<<<<< HEAD
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }

            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
=======
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        scene.scaleMode = .resizeFill
        scene.numberOfPlayers = viewController?.playerCount
        
        if(viewController?.modeControl.selectedSegmentIndex == 0) {
            scene.gameMode = "pick one"
        } else {
            scene.gameMode = "make teams"
        }
        
        scene.gv? = self
        
        skView.presentScene(scene)
>>>>>>> 1638a3f0e26efc69143777b9caee456bab5ea682
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
