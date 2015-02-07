//
//  TopMenu.swift
//  Leanovation
//
//  Created by Lowiegie on 1/27/15.
//  Copyright (c) 2015 Eastvantage. All rights reserved.
//

import UIKit

class TopMenu: UIView, UIGestureRecognizerDelegate {
    
    var common = Common()
    
    var leanovationTab:UIView!
    var personaeTab:UIView!
    
    
    let btnPersonae = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
    let btnLeanovation = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
    var personaeImage:UIImageView!

    
    var isTopMenuExpanded:Bool = false
    var isPersonaeTabActive:Bool = false
    var isLeanovationTabActive:Bool = false
    var isBlurLeanovationTabInitialize = false
    
    
    let personaeTabWidthInactive:CGFloat = 195
    let personaeTabWidthActive:CGFloat = 560
    
    let blurPersonaeViewTab = FXBlurView()
    let blurLeanovationViewTab = FXBlurView()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()

        // set up Leanovation tab
        
        layoutTab1()
        layoutTab2()

    }
    
    func layoutTab2() {
        
        
        
        personaeTab = UIView(frame: CGRectMake(550, 0, personaeTabWidthInactive, self.frame.height))
//        personaeTab = UIView(frame: CGRectMake(550, 0, 550, self.frame.height))
//        personaeTab.backgroundColor = UIColor.redColor()
        personaeTab.contentMode = .ScaleAspectFit
        
        var personaeImage = UIImageView(frame: CGRectMake(50, 50, 100, 200))
        personaeImage.image = UIImage(named: "user")
        personaeImage.contentMode = UIViewContentMode.ScaleAspectFit
//        personaeImage.clipsToBounds = true
        
        personaeTab.addSubview(personaeImage)
        
        btnPersonae.frame = CGRectMake(0, self.frame.height-50, personaeTabWidthActive, 50)
        
        
//        btnPersonae.layer.borderColor = UIColor.blackColor().CGColor
//        btnPersonae.layer.borderWidth = 1
        btnPersonae.setTitle("Personae", forState: .Normal)
        btnPersonae.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btnPersonae.contentHorizontalAlignment = .Left
        btnPersonae.titleEdgeInsets = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
        btnPersonae.setTranslatesAutoresizingMaskIntoConstraints(true)
        
        btnPersonae.backgroundColor = common.hexStringToUIColor("#A9B6C2")
//        btnPersonae.backgroundColor = UIColor.lightGrayColor()
//        btnPersonae.setTitleColor(.blackColor(), forState: .Normal)
        btnPersonae.addTarget(self, action: "btnPersonaeClick:", forControlEvents: .TouchUpInside)
        
        
        personaeTab.addSubview(btnPersonae)
        
        
        var lblName = UITextView(frame: CGRectMake(155, 50, 200, 400))

        lblName.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In aliquam, odio vitae semper tincidunt, neque arcu hendrerit massa, non pellentesque leo erat a enim. Vivamus metus leo, placerat eu diam nec, egestas varius quam. Fusce at rhoncus nunc. Cras ultricies vitae est efficitur malesuada. In suscipit augue in purus sollicitudin, sed convallis risus aliquam. Ut vulputate sem vel ex gravida, et efficitur enim tempus. Cras ut mollis mauris, in ullamcorper augue. Pellentesque leo ipsum, faucibus ac orci lobortis, egestas porta ex. Fusce a imperdiet ipsum."
        lblName.textAlignment = NSTextAlignment.Justified
        lblName.contentMode = .ScaleAspectFit
        
        personaeTab.addSubview(lblName)
        
        
        
        // add blur effect
        blurPersonaeViewTab.frame = CGRectMake(0, 0, personaeTabWidthInactive, self.frame.height-50)
        blurPersonaeViewTab.blurRadius = 5
        blurPersonaeViewTab.dynamic = false
        blurPersonaeViewTab.tintColor = .clearColor()
        
        personaeTab.addSubview(blurPersonaeViewTab)
        
        personaeTab.clipsToBounds = true
        
        self.addSubview(personaeTab)
        
        
    }
    
    
    
    func layoutTab1() {
        
        leanovationTab = UIView(frame: CGRectMake(0, 0, 550, self.frame.height))
//        leanovationTab.backgroundColor = UIColor.blueColor()
        
        
        var leanovationImage = UIImageView(frame: CGRectMake(50, 50, 450, 400))
        leanovationImage.image = UIImage(named: "xyz")
        leanovationImage.contentMode = UIViewContentMode.ScaleAspectFit
        leanovationImage.userInteractionEnabled = true
        
        // add gesture recognizer on the image
        var handleImageCoordinates = UITapGestureRecognizer(target: self, action: "breadCrumbsCoordinates:")
        handleImageCoordinates.delegate = self
        handleImageCoordinates.numberOfTapsRequired = 1
        handleImageCoordinates.numberOfTouchesRequired = 1
        leanovationImage.addGestureRecognizer(handleImageCoordinates)
        
        
        leanovationTab.addSubview(leanovationImage)
        
//        var btnLeanovation = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        btnLeanovation.frame = CGRectMake(0, self.frame.height-50, 550, 50)
        
        btnLeanovation.setTitle("Leanovation", forState: .Normal)
        btnLeanovation.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btnLeanovation.backgroundColor = common.hexStringToUIColor("#143E59")
        btnLeanovation.addTarget(self, action: "btnLeanovationClick:", forControlEvents: .TouchUpInside)
        
        leanovationTab.addSubview(btnLeanovation)
        
        //blur effect
//        blurLeanovationViewTab.frame = CGRectMake(400, 100, 100, 400)
        blurLeanovationViewTab.frame = CGRectMake(400, 0, 150, self.frame.height-50)
        blurLeanovationViewTab.blurRadius = 5
        blurLeanovationViewTab.dynamic = false
        blurLeanovationViewTab.tintColor = .clearColor()
        
        
        self.addSubview(leanovationTab)
        
        
    }
    
    
    func breadCrumbsCoordinates(tapSender:UITapGestureRecognizer) {
        
        println("IMAGE IS TAP")
        
        var location = tapSender.locationInView(tapSender.view)
        println(location.x)
        println(location.y)
        
        if ((location.x >= 46 && location.x <= 173) && (location.y >= 134 && location.y <= 262)){
            
            println("UNDERSTAND")
            var understandView = UnderstandView(frame: CGRectMake(50, 50, 460, 410))
            understandView.layoutIfNeeded()
            understandView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001)
            self.leanovationTab.addSubview(understandView)
            understandView.popUpUnderstandView()
            
            
            
            
            
        } else if ((location.x >= 174 && location.x <= 290) && (location.y >= 16 && location.y <= 82)) {
            
            println("CREATE")
            
            var createView = CreateView(frame: CGRectMake(50, 50, 460, 410))
            createView.layoutIfNeeded()
            createView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001)
            self.leanovationTab.addSubview(createView)
            createView.popUpCreateView()
            
        } else if ((location.x >= 275 && location.x <= 404) && (location.y >= 136 && location.y <= 264)) {
            
            println("TEST")
            
            var testView = TestView(frame: CGRectMake(50, 50, 460, 410))
            testView.layoutIfNeeded()
            testView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001)
            self.leanovationTab.addSubview(testView)
            testView.popUpTestView()
            
            
        } else if ((location.x >= 123 && location.x <= 329) && (location.y >= 290 && location.y <= 376)) {
            
            println("GOTO MARKET")
            var gotoMarketView = GotoMarketView(frame: CGRectMake(50, 50, 460, 410))
            gotoMarketView.layoutIfNeeded()
            gotoMarketView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001)
            self.leanovationTab.addSubview(gotoMarketView)
            gotoMarketView.popUpGotoMarketView()

        } else if ((location.x >= 190 && location.x <= 258) && (location.y >= 123 && location.y <= 249)) {
            
            println("PERSONAE")
            
            if (!isPersonaeTabActive) {
                
                self.personaeTab.sendSubviewToBack(self.blurPersonaeViewTab)
                self.leanovationTab.addSubview(self.blurLeanovationViewTab)
                
            }
            
            UIView.animateWithDuration(Double(0.5),
                delay: 0,
                // 6
                options: UIViewAnimationOptions.CurveEaseOut,
                animations: {
                    
                    self.resizeTab2Content()
                    
                },
                completion: nil)
            
            isLeanovationTabActive = false
            isPersonaeTabActive = true
            
            
        }


        
        

        
        
        
        
    }
    
    func btnLeanovationClick(sender:AnyObject) {
        
        println("MOVE FRAME BY LEANOVATION")
        
        if (!isLeanovationTabActive) {
            println("HINDI ACTIVE")
            self.blurLeanovationViewTab.removeFromSuperview()
//            self.leanovationTab.sendSubviewToBack(self.blurLeanovationViewTab)

            
        }
        
        
        if (!isTopMenuExpanded && !isPersonaeTabActive) {
            
        
            UIView.animateWithDuration(Double(0.5),
                delay: 0,
                // 6
                options: UIViewAnimationOptions.CurveEaseOut,
                animations: {
                    self.frame = CGRectMake(0, 0, 740, 550)
                    
                },
                completion: nil)
            
            isTopMenuExpanded = true
            
            
        } else if (isTopMenuExpanded && isPersonaeTabActive) {
            
            println("BTN LEANOVATION PERSONAE TAB ACTIVE")
            
            UIView.animateWithDuration(Double(0.5),
                delay: 0,
                // 6
                options: UIViewAnimationOptions.CurveEaseOut,
                animations: {
                    
                    self.resizeTab1Content()
                    
                },
                completion: nil)
            
            
        } else if (!isTopMenuExpanded && isPersonaeTabActive) {
            
            
            UIView.animateWithDuration(Double(0.5),
                delay: 0,
                // 6
                options: UIViewAnimationOptions.CurveEaseOut,
                animations: {
                    self.resizeTab1Content()
                    
                },
                completion: {
                    (value: Bool) in
                    
                    UIView.animateWithDuration(Double(0.5),
                        delay: 0,
                        // 6
                        options: UIViewAnimationOptions.CurveEaseOut,
                        animations: {
                            self.frame = CGRectMake(0, 0, 740, 550)
                            
                        },
                        completion: nil)
                    
                    
            })
            
            isTopMenuExpanded = true
            
        }
        
        
        isLeanovationTabActive = true
        isPersonaeTabActive = false
        
    }
    
    func btnPersonaeClick(sender:AnyObject) {
        
        println("MOVE FRAME BY PERSONAE")
//        println(isPersonaeTabActive)
//        println(isLeanovationTabActive)
//        println(isTopMenuExpanded)
//        
        if (!isPersonaeTabActive) {
            
            self.personaeTab.sendSubviewToBack(self.blurPersonaeViewTab)
            self.leanovationTab.addSubview(self.blurLeanovationViewTab)
          
        }
 
        
        
        if (!isTopMenuExpanded && !isPersonaeTabActive) {
            
            UIView.animateWithDuration(Double(0.5),
                delay: 0,
                // 6
                options: UIViewAnimationOptions.CurveEaseOut,
                animations: {
                    self.frame = CGRectMake(0, 0, 740, 550)
                    
                },
                completion: {
                    (value: Bool) in
                    
                    UIView.animateWithDuration(Double(0.5),
                        delay: 0,
                        // 6
                        options: UIViewAnimationOptions.CurveEaseOut,
                        animations: {
                            
                            self.resizeTab2Content()

                        },
                        completion: nil)
            
            
            })
            
            isTopMenuExpanded = true
            
            
        } else if (isLeanovationTabActive && isTopMenuExpanded) {
            
            println("BNT PERSONAE CLICK LEANOVATION TAB IS ACTIVE")
            
            UIView.animateWithDuration(Double(0.5),
                delay: 0,
                // 6
                options: UIViewAnimationOptions.CurveEaseOut,
                animations: {
                    
                    self.resizeTab2Content()

                },
                completion: nil)
            
        } else if (!isTopMenuExpanded && isPersonaeTabActive) {
            println("LOWIEGIE")
            UIView.animateWithDuration(Double(0.5),
                delay: 0,
                // 6
                options: UIViewAnimationOptions.CurveEaseOut,
                animations: {
                    
                    self.frame = CGRectMake(-400, 0, 1145, 550)
                    
                    
                    
                },
                completion: nil)
            
            isTopMenuExpanded = true
            
            
            
        }
        
        isLeanovationTabActive = false
        isPersonaeTabActive = true
        
    }

    func resizeTab1Content() {
        println("TAB 1 CONTENT")
        
        self.frame = CGRectMake(0, 0, 740, 550)
        
        self.personaeTab.frame = CGRectMake(550, 0, self.personaeTabWidthInactive, self.frame.height)
        self.personaeTab.clipsToBounds = true
        
        self.btnPersonae.frame = CGRectMake(0, self.frame.height-50, self.personaeTabWidthInactive, 50)
        self.btnPersonae.backgroundColor = self.common.hexStringToUIColor("#A9B6C2")
        self.btnPersonae.contentHorizontalAlignment = .Left
        self.btnPersonae.titleEdgeInsets = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
        
        self.btnLeanovation.contentHorizontalAlignment = .Center
        self.btnLeanovation.backgroundColor = self.common.hexStringToUIColor("#143E59")
        
        self.personaeTab.bringSubviewToFront(self.blurPersonaeViewTab)
        
        
        
    }
    
    func resizeTab2Content() {
    
        println("TAB 2 CONTENT")
        
        self.frame = CGRectMake(-400, 0, 1145, 550)
//        self.backgroundColor = .redColor()
//        self.frame = CGRectMake(-400, 0, 740, 550)
        self.personaeTab.clipsToBounds = false
        self.personaeTab.frame = CGRectMake(550, 0, self.personaeTabWidthActive + 35, self.frame.height)
        
        self.btnPersonae.frame = CGRectMake(0, self.frame.height-50, self.personaeTabWidthActive + 35, 50)
        self.btnPersonae.backgroundColor = self.common.hexStringToUIColor("#143E59")
        self.btnPersonae.contentHorizontalAlignment = .Center
        self.btnPersonae.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        
        self.btnLeanovation.contentHorizontalAlignment = .Right
        self.btnLeanovation.backgroundColor = self.common.hexStringToUIColor("#A9B6C2")
        self.btnLeanovation.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30)
        
        self.leanovationTab.bringSubviewToFront(self.blurLeanovationViewTab)
        
    
    }
    
    
    
    
    

    
    
    
    
    
}
