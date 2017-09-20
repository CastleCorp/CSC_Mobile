//
//  ViewController.swift
//  ThreeCards
//
//  Created by Joel Hollingsworth on 9/20/17.
//  Copyright © 2017 Joel Hollingsworth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstCardImage: UIImageView!
    @IBOutlet weak var secondCardImage: UIImageView!
    @IBOutlet weak var thirdCardImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func switchImage(_ card: UIImageView) {
        if(card.image == #imageLiteral(resourceName: "ace_of_spades")) {
            card.image = #imageLiteral(resourceName: "back_of_card")
        } else {
            card.image = #imageLiteral(resourceName: "ace_of_spades")
        }
    }
    
    @IBAction func firstCardTapped(_ sender: UITapGestureRecognizer) {
        switchImage(firstCardImage)
    }
    
    @IBAction func secondCardTapped(_ sender: UITapGestureRecognizer) {
        switchImage(secondCardImage)
    }
    
    @IBAction func thirdCardTapped(_ sender: UITapGestureRecognizer) {
       switchImage(thirdCardImage)
    }
    
}

