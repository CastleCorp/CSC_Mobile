//
//  GameViewController.swift
//  Rollerball
//
//  Created by Joel Hollingsworth on 11/7/16.
//  Copyright © 2016 Joel Hollingsworth. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = true
        scene.scaleMode = .resizeFill
        
        skView.presentScene(scene)
    }
}




