//
//  ViewController.swift
//  ThreeCards
//
//  Created by Joel Hollingsworth on 9/20/17.
//  Copyright © 2017 Joel Hollingsworth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var thirdCardImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /* Using a single function for all 3 Tap Gesture Recoginizers */
    @IBAction func cardTapped(_ sender: UITapGestureRecognizer) {
        
        // figure out which UIImageView was tapped
        let cardImageView = sender.view! as! UIImageView
        
        // flip the card
        if cardImageView.image == #imageLiteral(resourceName: "ace_of_spades") {
            cardImageView.image = #imageLiteral(resourceName: "back_of_card")
        } else {
            cardImageView.image = #imageLiteral(resourceName: "ace_of_spades")
        }
        
    }

}

