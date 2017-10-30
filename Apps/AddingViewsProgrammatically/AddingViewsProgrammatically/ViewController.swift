//
//  ViewController.swift
//  AddingViewsProgrammatically
//
//  Created by Parker Thomas on 10/30/17.
//  Copyright © 2017 Parker Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var theStackView: UIStackView!
    
    var labels: [UILabel] = []
    var count = 1 //next label number
    // we need to know where (relative to the stack view) where the top-left corner shpuld be placed. Here, that point is (0, yPos)
    var yPos: CGFloat = 0
    let spacing: CGFloat = 4 //constant for spacing between labels
    let maxLabels: CGFloat = 5 //constant for how many labels to allow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addNewLabel(_ sender: UIButton) {
        if(count - 1 < Int(maxLabels)) {
            let labelHeight = theStackView.frame.height / maxLabels //how tall each label is
            // create a label
            let label = UILabel(frame:CGRect(x: 0, y: yPos, width: theStackView.frame.width, height: labelHeight))
        
            // look and feel of the label
            label.backgroundColor = UIColor.cyan
            label.text = "Label \(count)"
            label.font = UIFont.preferredFont(forTextStyle: .body)
            label.textColor = .black
            label.textAlignment = .center
        
            //add the label to the stack view
            theStackView.addSubview(label)
        
            //update value for the next label
            count += 1
            yPos += labelHeight + spacing
        }
    }
    
}

