//
//  ViewController.swift
//  Leanovation
//
//  Created by Lowiegie on 1/23/15.
//  Copyright (c) 2015 Eastvantage. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UIPopoverControllerDelegate, CTAssetsPickerControllerDelegate, UIGestureRecognizerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
//    @IBOutlet var topMenu: UIView!
    
    
    let whiteBoardContainer = UIView()
    
    var topMenu:TopMenu!
    var popoverImageResources:UIPopoverController? = nil
    var popoverPickFromLibraryFolder:UIPopoverController? = nil
    var whiteBoardImages:[AnyObject] = []
    
    
    var counterTagToDelete:Int = 1000
    var imgTagToDelete:Int = 0
    var lineBorderPosition:CGFloat = 0.00
    
    var wobbleImage: Bool = false
    var isAllowedToDeleteImageFromWhiteBoard: Bool = false
    
    let btnDeleteTag:Int = 500
    
    @IBAction func displaySourceOption(sender: AnyObject) {
        
        println("displaySourceOption")
        var popoverContent = UIViewController()
        var popoverView = UIView(frame: CGRectMake(0, 0, 155, 65))
        
        // create source camera button
        var btnCamera = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        btnCamera.frame = CGRectMake(7, 5, 50, 50)
        btnCamera.setImage(UIImage(named: "camera"), forState: .Normal)
        btnCamera.addTarget(self, action: "cameraClick:", forControlEvents: .TouchUpInside)
        btnCamera.tag = 500
        
        popoverView.addSubview(btnCamera)
        
        
        // create separator line
        var libraryLineBorder = UIView(frame: CGRectMake(76, 8, 2, 43))
        libraryLineBorder.backgroundColor = UIColor.grayColor()
        libraryLineBorder.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        popoverView.addSubview(libraryLineBorder)
        
        // create source library button
        var btnLibraryPhotos = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        btnLibraryPhotos.frame = CGRectMake(95, 3, 50, 50)
        btnLibraryPhotos.setImage(UIImage(named: "gallery"), forState: .Normal)
        btnLibraryPhotos.addTarget(self, action: "photoLibraryClick:", forControlEvents: .TouchUpInside)
        btnLibraryPhotos.tag = 501
        
        popoverView.addSubview(btnLibraryPhotos)
        popoverContent.view = popoverView
        popoverContent.preferredContentSize = CGSizeMake(155, 65)
        
        self.popoverImageResources = UIPopoverController(contentViewController: popoverContent)
        
        self.popoverImageResources?.presentPopoverFromRect(CGRectMake(-96, 0, 155, 65), inView: sender as UIView, permittedArrowDirections: UIPopoverArrowDirection.Left, animated: true)

        
        
        
    }
    
    
    func popoverControllerDidDismissPopover(popoverController: UIPopoverController) {
        self.popoverImageResources = nil
        self.popoverPickFromLibraryFolder = nil
    }
    
    func assetsPickerController(picker: CTAssetsPickerController!, didFinishPickingAssets assets: [AnyObject]!) {
        println("did finish picking assets")
        
        if (self.popoverPickFromLibraryFolder != nil) {
            self.popoverPickFromLibraryFolder?.dismissPopoverAnimated(true)
            self.popoverImageResources?.dismissPopoverAnimated(true)
            
        }
        
        self.whiteBoardImages = NSMutableArray(array: assets)
        self.viewWillAppear(true)
    }

    
    
    
    func cameraClick(sender:AnyObject) {
        
        println("camera")
        
        
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)){
            //load the camera interface
            var picker : UIImagePickerController = UIImagePickerController()
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.delegate = self
            picker.allowsEditing = false
            self.presentViewController(picker, animated: true, completion: nil)
        }else{
            //no camera available
            println("NO CAMERA AVAILABLE")
            dispatch_async(dispatch_get_main_queue(), {
                
                var alert = UIAlertController(title: "Error", message: "There is no camera available", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: {(alertAction)in
                    alert.dismissViewControllerAnimated(true, completion: nil)
                }))
                self.presentViewController(alert, animated: true, completion: nil)
                
                
                }
            
            )
//            var alert = UIAlertController(title: "Error", message: "There is no camera available", preferredStyle: .Alert)
//            alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: {(alertAction)in
//                alert.dismissViewControllerAnimated(true, completion: nil)
//            }))
//            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    func photoLibraryClick(sender:AnyObject) {
        println("PHOTO LIBRARY")
        
        var ctAssetsPickerController: CTAssetsPickerController = CTAssetsPickerController()
        ctAssetsPickerController.assetsFilter = ALAssetsFilter.allPhotos()
        ctAssetsPickerController.delegate = self
        ctAssetsPickerController.selectedAssets = NSMutableArray(array: self.whiteBoardImages)
        
        
        self.popoverPickFromLibraryFolder = UIPopoverController(contentViewController: ctAssetsPickerController)
        self.popoverPickFromLibraryFolder?.delegate = self
        self.popoverPickFromLibraryFolder?.presentPopoverFromRect(CGRectMake(-5, -5, 90, 415), inView: sender as UIView, permittedArrowDirections: UIPopoverArrowDirection.Down, animated: true)
        
    }
    
    
    func reloadWhieteBoardImages() {
        var photo: ALAsset
        var img: UIImage
        
        if (self.whiteBoardImages.count > 0) {
            
            for i in self.whiteBoardImages {
                
                self.counterTagToDelete++
                var imgContainer = UIView(frame: CGRectMake(90, 90, 100, 100))
//                var imgContainer = UIImageView(frame: CGRectMake(90, 90, 100, 100))
//                imgContainer.backgroundColor = .redColor()
                imgContainer.userInteractionEnabled = true
                imgContainer.tag = self.counterTagToDelete
                
                // add plus 1 to subviews tag
                self.counterTagToDelete++
                
                var handleLongPressed = UILongPressGestureRecognizer(target: self, action: "deleteImgByLongPressed:")
                handleLongPressed.delegate = self
                handleLongPressed.numberOfTouchesRequired = 1
                
                var handlePan = UIPanGestureRecognizer(target: self, action: "moveWhiteBoardImage:")
                handlePan.delegate = self
                
                photo = i as ALAsset
            
                img = UIImage(CGImage: photo.thumbnail().takeUnretainedValue())!

                
                var newImage = UIImageView(frame: CGRectMake(10, 15, 80, 80))
                
//                var newImage = UIImageView(frame: CGRectMake(100, 100, 80, 80))
                
//                var newImage = UIImageView(frame: CGRectMake(100, 100, 44, 44))
                newImage.userInteractionEnabled = true
                
                newImage.tag = self.counterTagToDelete
                
//                newImage.image = cropImage
                newImage.image = img
                newImage.contentMode = .ScaleAspectFit
                
                
                var btnDelete = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
                btnDelete.frame = CGRectMake(2, 2, 20, 20)
                btnDelete.setImage(UIImage(named: "close"), forState: .Normal)
                btnDelete.addTarget(self, action: "removeImageFromWhiteBoard:", forControlEvents: .TouchUpInside)
                btnDelete.tag = self.counterTagToDelete
//                btnDelete.tag = btnDeleteTag
                
//                newImage.addSubview(btnDelete)
                btnDelete.hidden = true
                
                
//                newImage.addGestureRecognizer(handleLongPressed)
//                newImage.addGestureRecognizer(handlePan)
                imgContainer.addSubview(newImage)
                imgContainer.addSubview(btnDelete)
                
                

                
                
                
                imgContainer.addGestureRecognizer(handleLongPressed)
                imgContainer.addGestureRecognizer(handlePan)
                
                self.whiteBoardContainer.addSubview(imgContainer)
                
//                self.whiteBoardContainer.addSubview(newImage)
//                self.view.addSubview(newImage)
                
            }
            
            
        }
    }
    
    
    func moveWhiteBoardImage(sender:UIPanGestureRecognizer) {
        
        println("moved")
        
        let translation = sender.translationInView(self.view)
        sender.view!.center = CGPoint(x:sender.view!.center.x + translation.x,
            y:sender.view!.center.y + translation.y)
        sender.setTranslation(CGPointZero, inView: self.view)
        
        if sender.state == UIGestureRecognizerState.Ended {
            // 1
            let velocity = sender.velocityInView(self.view)
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            let slideMultiplier = magnitude / 200
            println("magnitude: \(magnitude), slideMultiplier: \(slideMultiplier)")
            // 2
            let slideFactor = 0.1 * slideMultiplier     //Increase for more of a slide
            // 3
            var finalPoint = CGPoint(x:sender.view!.center.x + (velocity.x * slideFactor),
                y:sender.view!.center.y + (velocity.y * slideFactor))
            // 4
            
            if (self.wobbleImage) {
                finalPoint.x = min(max(finalPoint.x, 0), self.view.bounds.size.width)
                
            } else {
                finalPoint.x = min(max(finalPoint.x, 0), self.lineBorderPosition - 40)
            }
            
            finalPoint.y = min(max(finalPoint.y, 0), self.view.bounds.size.height)
            
            // 5
            sender.view?.center = finalPoint
//            UIView.animateWithDuration(Double(slideFactor * 2),
//                delay: 0,
//                // 6
//                options: UIViewAnimationOptions.CurveEaseOut,
//                animations: {sender.view!.center = finalPoint },
//                completion: nil)
        }
        
        if (sender.state == .Changed) {
            println("MAY CHANGED DIN")
        }
        
        
    }
    
    func deleteImgByLongPressed(lp:UILongPressGestureRecognizer) {
        
        println("long pressed")
        println("TAG: \(lp.view?.tag)")
        self.imgTagToDelete = lp.view!.tag
//        var x = lp.view!.center.x
//        var y = lp.view!.center.y
        
        switch lp.state {
            
        case .Began:
            println("began")
            if (!self.wobbleImage) {
                
                for i in lp.view!.subviews {
                    
                    if (i.tag == self.imgTagToDelete + 1 && i.isKindOfClass(UIButton)) {
                        var btnView = i as UIView
                        btnView.hidden = false
                    }
                    
                }
                
                self.startQuivering(lp.view!)
                
                
            }
            
            
            
        case .Changed:
            println("CHANGED")
            
            
            
            default: break
            
            
        }

        
        
        
        
    }
    
    
    func removeImageFromWhiteBoard(sender:AnyObject) {
        self.isAllowedToDeleteImageFromWhiteBoard = true
        
        println("removed")
        
        for v in self.whiteBoardContainer.subviews {
            
            if (v.tag == self.imgTagToDelete) {
                stopQuivering(v as UIView)
                v.removeFromSuperview()
                self.imgTagToDelete = 0
                
            }

            
        }
        
        
    }
    
    
    func startQuivering(myView:UIView) {
        
        let anim = CABasicAnimation(keyPath: "transform")
        anim.toValue = NSValue(CATransform3D:CATransform3DMakeScale(1.1, 1.1, 1))
        anim.fromValue = NSValue(CATransform3D:CATransform3DIdentity)
        anim.repeatCount = Float.infinity
        anim.autoreverses = true
        
        var timeOffset:Float = Float(arc4random()%100)/100 - 0.50
        anim.timeOffset = CFTimeInterval(timeOffset)
        myView.layer.addAnimation(anim, forKey: "quivering")
        self.wobbleImage = true
        
        
    }
    
    func stopQuivering(myView:UIView) {
        println("stop quivering")
        myView.layer.removeAllAnimations()
        self.wobbleImage = false
        
    }

    
    
    
    func drawSplitViewLine() {
        
        self.lineBorderPosition = (self.view.bounds.width - (self.view.frame.width / 4)) - 20
        
        var x =  (self.view.bounds.width - (self.view.frame.width / 4)) - 20
//        println(self.view.frame.width - x)
    
        var line = UIView(frame: CGRectMake(x, 0, 1, self.view.frame.height))
//        var line = UIView(frame: CGRectMake(700, 0, 1, self.view.frame.height))
        line.backgroundColor = UIColor.blackColor()
        line.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        self.view.addSubview(line)
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        println("LOADED AGAIN")
        
        
        reloadWhieteBoardImages()
        
        
        
    }

    @IBAction func releaseAllTransactions(sender: AnyObject) {
        println("REMOVE ALL TRANSACTIONS")
        
        if (self.wobbleImage) {
            
            for i in self.whiteBoardContainer.subviews {
                for j in i.subviews {
                    
                    if (j.tag == self.imgTagToDelete + 1 && j.isKindOfClass(UIButton)) {

                        var btnView = j as UIView
                        btnView.hidden = true
                        stopQuivering(i as UIView)
                        self.imgTagToDelete = 0
                        
                    }
                    
                }
                
            }
            
        }
        
        if (topMenu.isTopMenuExpanded && topMenu.isLeanovationTabActive) {
            
            UIView.animateWithDuration(Double(0.5),
                delay: 0,
                // 6
                options: UIViewAnimationOptions.CurveEaseOut,
                animations: {
                    self.topMenu.frame = CGRectMake(0, -500, 740, 550)
                    
                },
                completion: nil)
            self.topMenu.isTopMenuExpanded = false


            

        } else if (topMenu.isTopMenuExpanded && topMenu.isPersonaeTabActive) {
            
            UIView.animateWithDuration(Double(0.5),
                delay: 0,
                // 6
                options: UIViewAnimationOptions.CurveEaseOut,
                animations: {
                    
                    self.topMenu.frame = CGRectMake(-400, -500, 1145, 550)
                    
                },
                completion: nil)
            self.topMenu.isTopMenuExpanded = false
            
            
            
        }
        
        
    }
    
    func hideWhiteBoardContainer() {
        println("HIDE WHITE BOARD")
        self.whiteBoardContainer.hidden = true
        self.whiteBoardContainer.alpha = 0.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        whiteBoardContainer.frame = CGRectMake(0, 25, 750, 650)
//        whiteBoardContainer.backgroundColor = UIColor.yellowColor()
        whiteBoardContainer.tag = 5
        self.view.addSubview(whiteBoardContainer)
        
        // Do any additional setup after loading the view, typically from a nib.
//        var topMenu = TopMenu(frame: CGRectMake(0, 20, 740, 550))
        topMenu = TopMenu(frame: CGRectMake(0, -500, 740, 550))
        topMenu.backgroundColor = UIColor.whiteColor()
        topMenu.layoutIfNeeded()
        
        self.view.addSubview(topMenu)
        
        drawSplitViewLine()
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

