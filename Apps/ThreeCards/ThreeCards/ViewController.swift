//
//  ViewController.swift
//  ThreeCards
//
//  Created by Joel Hollingsworth on 9/20/17.
//  Copyright © 2017 Joel Hollingsworth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // View
    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var thirdCardImageView: UIImageView!
    
    var imageViews: [UIImageView] = []
    
    // Model
    let threeCardModel = ThreeCardModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // place the imageviews into an array to mimic the hand of cards
        imageViews = [firstCardImageView, secondCardImageView, thirdCardImageView]
        
        // assign the images from the hand of cards
        for i in 0..<imageViews.count {
            imageViews[i].image = threeCardModel.getCardImage(i)
        }
    }

    /* Using a single function for all 3 Tap Gesture Recoginizers */
    @IBAction func cardTapped(_ sender: UITapGestureRecognizer) {
        
        // figure out which UIImageView was tapped
        //let cardImageView = sender.view! as! UIImageView
        
        
    }

}

