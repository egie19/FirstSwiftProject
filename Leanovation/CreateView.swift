//
//  CreateView.swift
//  Leanovation
//
//  Created by Lowiegie on 2/2/15.
//  Copyright (c) 2015 Eastvantage. All rights reserved.
//

import UIKit

class CreateView: UIView, UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var items: [String] = ["None"]
    var headerTitle = ""
    let tableViewList = UITableView(frame: CGRectMake(10, 25, 400, 370), style: UITableViewStyle.Plain)
    var tableViewListContainer = UIView(frame: CGRectMake(15, 4, 435, 405))


    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutIfNeeded() {
        
        super.layoutIfNeeded()
        
        var createImage = UIImageView(frame: CGRectMake(0, 0, 450, 400))
        createImage.image = UIImage(named: "view1zoom")
        createImage.contentMode = UIViewContentMode.ScaleAspectFit
        createImage.userInteractionEnabled = true
        
        var handleCreateViewTap = UITapGestureRecognizer(target: self, action: "subViewsOfCreateView:")
        handleCreateViewTap.numberOfTouchesRequired = 1
        handleCreateViewTap.numberOfTapsRequired = 1
        handleCreateViewTap.delegate = self
        
        createImage.addGestureRecognizer(handleCreateViewTap)
        
        self.addSubview(createImage)
        
        createTableView()
        
        self.tableViewList.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    
    func subViewsOfCreateView(tapSender:UITapGestureRecognizer) {
        
        var location = tapSender.locationInView(tapSender.view)
//        println(location.x)
//        println(location.y)
        
        if ((location.x >= 22 && location.x <= 123) && (location.y >= 158 && location.y <= 235)) {
            println("PRIORITIZATION")
            
            self.items = ["Tool1", "Tool2"]
            self.headerTitle = "PRIORITIZATION"
            
            self.tableViewList.reloadData()
            
            fadeIn()
            
            
            
        } else if ((location.x >= 184 && location.x <= 272) && (location.y >= 110 && location.y <= 157)) {
            println("IDEATION")
            
            self.items = ["Tool1", "Tool2"]
            self.headerTitle = "IDEATION"
            
            self.tableViewList.reloadData()
            
            fadeIn()
            
        } else if ((location.x >= 355 && location.x <= 429) && (location.y >= 182 && location.y <= 225)) {
            println("CONCEPT")
            
            self.items = ["Tool1", "Tool2"]
            self.headerTitle = "CONCEPT"
            
            self.tableViewList.reloadData()
            
            fadeIn()
            
        } else {
            self.removeFromSuperview()
            
        }
        
        
        
        
        
        
        
        
    }
    
    func popUpCreateView() {
        
        UIView.animateWithDuration(0.3/1.5, animations: {
            self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1)
            }, completion: {
                
                (value: Bool) in
                
                UIView.animateWithDuration(0.3/2, animations: {
                    self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9)
                    
                    }, completion: {
                        
                        (value: Bool) in
                        
                        UIView.animateWithDuration(0.3/2, animations: {
                            self.transform = CGAffineTransformIdentity
                        })
                        
                        
                })
                
                
        })
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier:String = "Cell"
        
        var cell:UITableViewCell = self.tableViewList.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        cell.textLabel?.textAlignment = .Center
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("SELECT \(indexPath.row)")
        
        var showToolView = CreateViewTool(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height))
        
        showToolView.setModel(indexPath.row)
        showToolView.setMainModelName(self.headerTitle)
        showToolView.layoutIfNeeded()
        
        window?.addSubview(showToolView)
        
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        println("WALA PA")
        
    }
    
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerLabel = UILabel(frame: CGRectMake(0, 0, self.frame.size.width, 30))
        headerLabel.text = self.headerTitle
        headerLabel.textAlignment = .Center
        headerLabel.backgroundColor = .lightGrayColor()
        return headerLabel
    }
    
    
    
    func createTableView() {
        
        println("TABLE VIEW")
        
        // UITableView Settings
        self.tableViewList.rowHeight = 45
        self.tableViewList.sectionHeaderHeight = 50
        self.tableViewList.tableHeaderView?.backgroundColor = .greenColor()
        self.tableViewList.userInteractionEnabled = true
        self.tableViewList.bounces = true
        
        self.tableViewList.delegate = self
        self.tableViewList.dataSource = self
        
        self.tableViewList.userInteractionEnabled = true
        
        self.tableViewListContainer.userInteractionEnabled = true
        self.tableViewListContainer.addSubview(tableViewList)
        self.tableViewListContainer.backgroundColor = UIColor.clearColor()
        
        // Close button
        
        var btnDelete = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        btnDelete.frame = CGRectMake(406, 0, 30, 30)
        btnDelete.setImage(UIImage(named: "close"), forState: .Normal)
        btnDelete.addTarget(self, action: "closeMenu:", forControlEvents: .TouchUpInside)
        
        self.tableViewListContainer.addSubview(btnDelete)
        
        self.addSubview(self.tableViewListContainer)
        
        tableViewListContainer.hidden = true
        
        
    }
    
    func fadeIn() {
        
        UIView.animateWithDuration(Double(0.5),
            delay: 0,
            // 6
            options: UIViewAnimationOptions.CurveEaseOut,
            animations: {
                
                self.tableViewListContainer.hidden = false
            },
            completion: nil)
        
        
        
        
    }
    
    func fadeOut() {
        
        UIView.animateWithDuration(Double(0.5),
            delay: 0,
            // 6
            options: UIViewAnimationOptions.CurveEaseOut,
            animations: {
                
                self.tableViewListContainer.hidden = true
            },
            completion: nil)
        
        
    }
    
    func closeMenu(event:AnyObject) {
        
        
        fadeOut()
        
        
    }

    

}
