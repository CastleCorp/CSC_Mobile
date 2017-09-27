//
//  ViewController.swift
//  SixteenCards
//
//  Created by Parker Thomas on 9/25/17.
//  Copyright © 2017 Parker Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Top labels
    @IBOutlet weak var flipsLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    // Image views seperated by row
    @IBOutlet weak var firstCardImageViewController: UIImageView!
    @IBOutlet weak var secondCardImageViewController: UIImageView!
    @IBOutlet weak var thirdCardImageViewController: UIImageView!
    @IBOutlet weak var fourthCardImageViewController: UIImageView!
    
    @IBOutlet weak var fifthCardImageViewController: UIImageView!
    @IBOutlet weak var sixthCardImageViewController: UIImageView!
    @IBOutlet weak var seventhCardImageViewController: UIImageView!
    @IBOutlet weak var eighthCardImageViewController: UIImageView!
    
    @IBOutlet weak var ningthCardImageViewController: UIImageView!
    @IBOutlet weak var tenthCardImageViewController: UIImageView!
    @IBOutlet weak var eleventhCardImageViewController: UIImageView!
    @IBOutlet weak var twelfthCardImageViewController: UIImageView!
    
    @IBOutlet weak var thirteenthCardImageViewController: UIImageView!
    @IBOutlet weak var fourteenthCardImageViewController: UIImageView!
    @IBOutlet weak var fifteenthCardImageViewController: UIImageView!
    @IBOutlet weak var sixteenthCardImageViewController: UIImageView!
    
    
    // Bottom label
    @IBOutlet weak var messageAreaLabel: UILabel!
    
    var imageViews: [UIImageView] = []
    var flipCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViews = [firstCardImageViewController, secondCardImageViewController, thirdCardImageViewController, fourthCardImageViewController, fifthCardImageViewController, sixthCardImageViewController, seventhCardImageViewController, eighthCardImageViewController, ningthCardImageViewController, tenthCardImageViewController, eleventhCardImageViewController, twelfthCardImageViewController, thirteenthCardImageViewController, fourteenthCardImageViewController, fifteenthCardImageViewController, sixteenthCardImageViewController]
        
        for imageView in imageViews {
            imageView.image = #imageLiteral(resourceName: "back_of_card")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func flipCard(_ card: UIImageView) {
        if card.image == #imageLiteral(resourceName: "back_of_card") {
            card.image = #imageLiteral(resourceName: "ace_of_spades")
        } else {
            card.image = #imageLiteral(resourceName: "back_of_card")
        }
        
        addToFlipCounter()
    }
    
    func addToFlipCounter() {
        flipCounter = flipCounter + 1
        flipsLabel.text = "Flips: \(flipCounter)"
    }
    
    @IBAction func cardTapped(_ sender: UITapGestureRecognizer) {
       
        let imageView = sender.view! as! UIImageView
        
        var which = -1
        for i in 0..<imageViews.count {
            if imageViews[i] == imageView {
                which = i
            }
        }
        flipCard(imageViews[which])
    }
}

