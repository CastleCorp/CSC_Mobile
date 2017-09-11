//
//  ViewController.swift
//  FirstUI
//
//  Created by Parker Thomas on 9/11/17.
//  Copyright © 2017 Parker Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.text = "Type something above!"
    }

    @IBAction func doPressMeButton(_ sender: UIButton) {
        outputLabel.text = inputTextField.text
        inputTextField.text = ""
    }
}

