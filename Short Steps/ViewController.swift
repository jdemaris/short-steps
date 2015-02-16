//
//  ViewController.swift
//  Short Steps
//
//  Created by Justin DeMaris on 2/11/15.
//  Copyright (c) 2015 Justin DeMaris. All rights reserved.
//

import UIKit
import CoreMotion
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var stepCount: UILabel!

    let pedometer = CMPedometer()
    
    let lengthFormatter = NSLengthFormatter()
    
    let dateFormatter = NSDateFormatter()
    
    let imageIndex = [
        UIImage(named:"DSC06971.jpg"),
        UIImage(named:"IMG_0264.jpg"),
        UIImage(named:"IMG_0345.jpg"),
        UIImage(named:"IMG_0354.jpg"),
        UIImage(named:"IMG_0381.jpg"),
        UIImage(named:"IMG_0398.jpg"),
        UIImage(named:"IMG_4071.jpg"),
        UIImage(named:"IMG_4107.jpg"),
        UIImage(named:"IMG_4151.jpg"),
        UIImage(named:"IMG_4194.jpg"),
        UIImage(named:"IMG_4198.jpg"),
        UIImage(named:"IMG_4326.jpg"),
        UIImage(named:"IMG_4346.jpg"),
        UIImage(named:"IMG_4358.jpg"),
        UIImage(named:"IMG_4377.jpg"),
        UIImage(named:"IMG_4443.jpg"),
        UIImage(named:"IMG_4446.jpg"),
        UIImage(named:"IMG_4470.jpg"),
        UIImage(named:"IMG_4484.jpg"),
        UIImage(named:"IMG_4509.jpg"),
        UIImage(named:"IMG_4633.jpg"),
        UIImage(named:"PomPuppySmallest.jpg"),
        UIImage(named:"tobywings.png"),
    ]

    var steps: Int = 0
    
    @IBOutlet weak var motivationImage: UIImageView!
    
    @IBAction func swipeRight(sender: UISwipeGestureRecognizer) {
        println("Swiped Right")
    }
    
    @IBAction func swipeLeft(sender: UISwipeGestureRecognizer) {
        println("Swiped Left")
    }
    
    func randomMotivation() {
        let idx = Int(arc4random_uniform(UInt32(imageIndex.count)))
        dispatch_async(dispatch_get_main_queue(), {
            self.motivationImage.image = self.imageIndex[idx]
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let start:NSDate = dateFormatter.dateFromString(dateFormatter.stringFromDate(NSDate()))!
        
        pedometer.startPedometerUpdatesFromDate(start, withHandler: { data, error in
            if !(error != nil) {
                dispatch_async(dispatch_get_main_queue(), {
                    self.stepCount.text = "\(data.numberOfSteps)"
                })
            }
        })
        
        NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: Selector("randomMotivation"), userInfo: nil, repeats: true)
    }
}

