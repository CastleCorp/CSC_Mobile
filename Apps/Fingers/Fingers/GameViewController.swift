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
    
    var viewController: ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
