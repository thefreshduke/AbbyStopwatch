//
//  ViewController.swift
//  AbbyStopwatch
//
//  Created by Scotty Shaw on 8/2/16.
//  Copyright © 2016 ___sks6___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBAction func startTime(sender: AnyObject) {
        timeLabel.text = "START"
        alternateButtons()
    }
    
    @IBAction func stopTime(sender: AnyObject) {
        timeLabel.text = "STOP"
        alternateButtons()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        stopButton.enabled = false
        stopButton.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alternateButtons() {
        startButton.enabled = !startButton.enabled
        startButton.hidden = !startButton.hidden
        stopButton.enabled = !stopButton.enabled
        stopButton.hidden = !stopButton.hidden
    }
}

