//
//  LeanovationTab.swift
//  Leanovation
//
//  Created by Lowiegie on 1/28/15.
//  Copyright (c) 2015 Eastvantage. All rights reserved.
//

import UIKit

class LeanovationTab: UIView {
    
    var btnLeanovation = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
    
    var common = Common()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutIfNeeded() {
        println("set up top menu")
//        var btnLeanovation = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        btnLeanovation.frame = CGRectMake(0, -30, 550, 30)
        
//        btnLeanovation.setImage(UIImage(named: "gallery"), forState: .Normal)
        btnLeanovation.setTitle("Leanovation", forState: .Normal)
        btnLeanovation.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btnLeanovation.backgroundColor = common.hexStringToUIColor("#143E59")
        
        self.addSubview(btnLeanovation)
        
        
        
    }
    
    func moveFrames(sender:AnyObject) {
        
        println("MOVE FRAME")
        
        UIView.animateWithDuration(Double(0.5),
            delay: 0,
            // 6
            options: UIViewAnimationOptions.CurveEaseOut,
            animations: {
                self.frame = CGRectMake(0, 0, 740, 550)
                //                sender.view!.center = finalPoint
            },
            completion: nil)
        
        
        
    }

    
        
    

    
    

}
