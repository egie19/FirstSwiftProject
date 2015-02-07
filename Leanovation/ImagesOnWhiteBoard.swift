//
//  ImagesOnWhiteBoard.swift
//  Leanovation
//
//  Created by Lowiegie on 1/26/15.
//  Copyright (c) 2015 Eastvantage. All rights reserved.
//

import UIKit

class ImagesOnWhiteBoard: UIImageView, UIGestureRecognizerDelegate {
    
    var counterTagToDelete:Int = 1000
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        assignGestureRecogNizer()
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    
    func assignGestureRecogNizer() {
        
        println("ASSIGN GESTURE")
//        var handleLongPressed = UILongPressGestureRecognizer(target: self, action: "deleteImgByLongPressed:")
//        handleLongPressed.delegate = self
//        handleLongPressed.numberOfTouchesRequired = 1
        
//        var handlePan = UIPanGestureRecognizer(target: self, action: "moveWhiteBoardImage:")
//        handlePan.delegate = self
//        
//        
//        self.contentMode = .ScaleAspectFit
//        self.addGestureRecognizer(handlePan)
//        self.addSubview(self.frame.vi)
//        
//        var handlePan = UIPanGestureRecognizer(target: self, action: "moveWhiteBoardImage:")
//        handlePan.delegate = self
        
        
        
        
    }
    
    
    func moveWhiteBoardImage(sender:UIPanGestureRecognizer) {
        
        println("moved")
        
        let translation = sender.translationInView(self)
        sender.view!.center = CGPoint(x:sender.view!.center.x + translation.x,
            y:sender.view!.center.y + translation.y)
        sender.setTranslation(CGPointZero, inView: self)
        
        if sender.state == UIGestureRecognizerState.Ended {
            // 1
            let velocity = sender.velocityInView(self)
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            let slideMultiplier = magnitude / 200
            println("magnitude: \(magnitude), slideMultiplier: \(slideMultiplier)")
            // 2
            let slideFactor = 0.1 * slideMultiplier     //Increase for more of a slide
            // 3
            var finalPoint = CGPoint(x:sender.view!.center.x + (velocity.x * slideFactor),
                y:sender.view!.center.y + (velocity.y * slideFactor))
            // 4
            finalPoint.x = min(max(finalPoint.x, 0), self.bounds.size.width)
            finalPoint.y = min(max(finalPoint.y, 0), self.bounds.size.height)
            
            // 5
            UIView.animateWithDuration(Double(slideFactor * 2),
                delay: 0,
                // 6
                options: UIViewAnimationOptions.CurveEaseOut,
                animations: {sender.view!.center = finalPoint },
                completion: nil)
        }
        
        
    }
    
    

    
    
    
    

}
