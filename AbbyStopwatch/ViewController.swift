//
//  ViewController.swift
//  AbbyStopwatch
//
//  Created by Scotty Shaw on 8/2/16.
//  Copyright © 2016 ___sks6___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var counter = 0
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBAction func startTime(sender: AnyObject) {
        validateTimer()
        alternateButtons()
    }
    
    @IBAction func stopTime(sender: AnyObject) {
        timer.invalidate()
        alternateButtons()
        counter = 0
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
    
    func validateTimer() {
        let repeatingFunction = #selector(ViewController.updateTime)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: repeatingFunction, userInfo: nil, repeats: true)
    }
    
    func updateTime() {
        counter += 1
        let (numMinutes, numSeconds, numMilliseconds) = calculateTimeUnits()
        
        // concatenate minutes, seconds, and milliseconds, then assign them to the UILabel
        timeLabel.text = "\(numMinutes):\(numSeconds):\(numMilliseconds)"
    }
    
    func calculateTimeUnits() -> (String, String, String) {
        var remainingCounter = counter
        
        // calculate elapsed minutes
        let minutes = remainingCounter / (60 * 100)
        remainingCounter -= minutes * (60 * 100)
        
        // calculate elapsed seconds
        let seconds = remainingCounter / 100
        remainingCounter -= seconds * 100
        
        // calculate elasped milliseconds
        let milliseconds = remainingCounter
        
        // add the leading zero for minutes, seconds, and milliseconds, then store them as string constants
        let formattedStringMinutes = String(format: "%02d", minutes)
        let formattedStringSeconds = String(format: "%02d", seconds)
        let formattedStringMilliseconds = String(format: "%02d", milliseconds)
        
        return (formattedStringMinutes, formattedStringSeconds, formattedStringMilliseconds)
    }
}

