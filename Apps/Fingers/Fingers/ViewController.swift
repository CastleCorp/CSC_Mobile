//
//  ViewController.swift
//  Fingers
//
//  Created by Parker Thomas on 10/23/17.
//  Copyright © 2017 Parker Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playersLabel: UILabel!
    @IBOutlet weak var playerStepper: UIStepper!
    @IBOutlet weak var modeControl: UISegmentedControl!
    
    public var playerCount: Int = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goButton" {
            let navigationController = segue.destination as! UINavigationController
            let vc = navigationController.viewControllers.first as! GameViewController
            
            vc.viewController = self
        }
    }
    
    @IBAction func stepperChanged(_ sender: Any) {
//        let labelText: String = playersLabel.text!
//        let num: Int! = Int(labelText)
        
        playersLabel.text! = String(Int(playerStepper!.value))
        playerCount = Int(playerStepper.value)
    }
    
}
