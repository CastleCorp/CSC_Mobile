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
    
    let matchGameModel = MatchGameModel()
    var flipCounter = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageAreaLabel.numberOfLines = 0
        messageAreaLabel.text = "Match cards by suit or value to earn points. \n Tap a card to start!"
        
        imageViews = [firstCardImageViewController, secondCardImageViewController, thirdCardImageViewController, fourthCardImageViewController, fifthCardImageViewController, sixthCardImageViewController, seventhCardImageViewController, eighthCardImageViewController, ningthCardImageViewController, tenthCardImageViewController, eleventhCardImageViewController, twelfthCardImageViewController, thirteenthCardImageViewController, fourteenthCardImageViewController, fifteenthCardImageViewController, sixteenthCardImageViewController]
        
        for i in 0..<imageViews.count {
            imageViews[i].image = matchGameModel.getCardImage(i)
        }
        for i in 0..<imageViews.count {
            matchGameModel.remainingCards.append(matchGameModel.hand[i])
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func restartGame() {
        for i in 0..<imageViews.count {
            imageViews[i].isUserInteractionEnabled = true
            imageViews[i].alpha = 1
            imageViews[i].image = matchGameModel.getCardImage(i)
        }
        messageAreaLabel.text = "Match cards by suit or value to earn points. \n Tap a card to start!"
        flipCounter = 0
        score = 0
        flipsLabel.text = "Flips: \(flipCounter)"
        scoreLabel.text = "Score: \(score)"
        matchGameModel.lastCardFlipped = -1
    }
    
    func addToFlips() {
        flipCounter = flipCounter + 1
        flipsLabel.text = "Flips: \(flipCounter)"
    }
    
    func addToScore(_ value: Int) {
        score = score + value
        scoreLabel.text = "Score: \(score)"
    }
    
    func gameOverAlert() {
        let alert = UIAlertController(title: "Game over!", message: "Would you like to play again?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Play again!", style: .default, handler: { action in
            switch action.style{
            case .default:
               self.matchGameModel.restartGame()
               self.restartGame()
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            }
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                alert.dismiss(animated: true, completion: nil)
                
            case .destructive:
                print("destructive")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func cardTapped(_ sender: UITapGestureRecognizer) {
       
        let cardImageView = sender.view! as! UIImageView
        
        var which = -1
        for i in 0..<imageViews.count {
            if cardImageView == imageViews[i] {
                which = i
            }
        }
          // Couldn't get matchesRemaining to work, but the alert works and the "play again" button works
          // Uncomment the line below to try it
          // gameOverAlert()
        
// Does not work vvv
//        if(!matchGameModel.matchesRemaining()) {
//            gameOverAlert()
//        }
        
        
<<<<<<< HEAD
=======
        if(!matchGameModel.matchesRemaining()) {
        
        }
>>>>>>> aedd8f27bfb53af5b8a9d98c935efd012c961bb3
        
        if(matchGameModel.getCardImage(which) == #imageLiteral(resourceName: "back_of_card") /*&& matchGameModel.matchesRemaining()*/) {
            
            matchGameModel.flipCard(which)
            imageViews[which].image = matchGameModel.getCardImage(which)
            addToFlips()
            
            //print("which: \(which)")
            //print("start \(matchGameModel.lastCardFlipped)")
            
            if(matchGameModel.lastCardFlipped != -1 && matchGameModel.matchesRemaining()) {
                
                // test if the lastCardFlipped matches the card just tapped
                if(matchGameModel.cardsMatch(which, matchGameModel.lastCardFlipped).0 || matchGameModel.cardsMatch(which, matchGameModel.lastCardFlipped).1) {
                   
                    print("Match")
                    
                    imageViews[which].isUserInteractionEnabled = false
                    imageViews[matchGameModel.lastCardFlipped].isUserInteractionEnabled = false
                    imageViews[which].alpha = 0.5
                    imageViews[matchGameModel.lastCardFlipped].alpha = 0.5
                    

                    if(matchGameModel.cardsMatch(which, matchGameModel.lastCardFlipped).0 && !matchGameModel.cardsMatch(which, matchGameModel.lastCardFlipped).1) {
                        // Match by suit only add 4
                        addToScore(4)
                        messageAreaLabel.text = "You matched suits!"
                        
                    } else if(matchGameModel.cardsMatch(which, matchGameModel.lastCardFlipped).1 && !matchGameModel.cardsMatch(which, matchGameModel.lastCardFlipped).0) {
                        // Match by value only add 16
                        addToScore(16)
                        messageAreaLabel.text = "You matched values!"
                        
                    } else {
                        // Match by both suit and value add 20. Shouldn't happen unless there are two of the same cards, but you never know (for example, jokers)
                        addToScore(20)
                        messageAreaLabel.text = "You matched suits and values!"
                        
                    }
                    
                    matchGameModel.lastCardFlipped = -1

                    return
                    
                } else {
                    
                    print("No match")
                    
                    // cards did not match, so flip them to the back
                    matchGameModel.flipCard(matchGameModel.lastCardFlipped)
                    imageViews[matchGameModel.lastCardFlipped].image = matchGameModel.getCardImage(matchGameModel.lastCardFlipped)
                    messageAreaLabel.text = "You picked: \(matchGameModel.getCardText(which)) \n No match."
                    
                    matchGameModel.lastCardFlipped = which

                    return
                }
                
            }
            
            messageAreaLabel.text = "You picked: \(matchGameModel.getCardText(which))"
            matchGameModel.lastCardFlipped = which
            
        } else {
            // No matches remaining. (left over from testing if there are still matches
            print("No more matches")
            
        }
    }
}

