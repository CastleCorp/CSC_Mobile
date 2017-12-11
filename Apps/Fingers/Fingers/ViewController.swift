//
//  ViewController.swift
//  Fingers
//
//  Created by Parker Thomas on 10/23/17.
//  Copyright © 2017 Parker Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
<<<<<<< HEAD
    override func viewDidLoad() {
        super.viewDidLoad()
    }
=======
    
    @IBOutlet weak var playersLabel: UILabel!
    @IBOutlet weak var playerStepper: UIStepper!
    @IBOutlet weak var modeControl: UISegmentedControl!
    
    public var playerCount: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! GameViewController
        vc.viewController = self
    }
    
    @IBAction func stepperChanged(_ sender: Any) {
        playersLabel.text! = String(Int(playerStepper!.value))
        playerCount = Int(playerStepper.value)
    }
    
>>>>>>> 1638a3f0e26efc69143777b9caee456bab5ea682
}
