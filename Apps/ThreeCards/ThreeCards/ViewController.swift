//
//  ViewController.swift
//  ThreeCards
//
//  Created by Joel Hollingsworth on 9/20/17.
//  Copyright © 2017 Joel Hollingsworth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // User Interface (View)
    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var thirdCardImageView: UIImageView!
    
    var imageViews: [UIImageView] = []
    
    // Model
    let model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        imageViews = [firstCardImageView, secondCardImageView, thirdCardImageView]
        
        for i in 0..<imageViews.count {
            imageViews[i].image = model.getCardImage(i)
        }
    }

    /* Using a single function for all 3 Tap Gesture Recoginizers */
    @IBAction func cardTapped(_ sender: UITapGestureRecognizer) {
        
        // figure out which UIImageView was tapped
        let cardImageView = sender.view! as! UIImageView
        
        // find which card was tapped
        var which = -1
        for i in 0..<imageViews.count {
            if imageViews[i] == cardImageView {
                which = i
            }
        }
        
        //model.flipCard(which)
        
        //update the View
    }

}

