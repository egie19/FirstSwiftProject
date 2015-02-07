//
//  TestView.swift
//  Leanovation
//
//  Created by Lowiegie on 2/2/15.
//  Copyright (c) 2015 Eastvantage. All rights reserved.
//

import UIKit

class TestView: UIView, UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate {
    
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
        
        var testImage = UIImageView(frame: CGRectMake(0, 0, 450, 400))
        testImage.image = UIImage(named: "view3zoom")
        testImage.contentMode = UIViewContentMode.ScaleAspectFit
        testImage.userInteractionEnabled = true
        
        var handleTestViewTap = UITapGestureRecognizer(target: self, action: "subViewsOfTestView:")
        handleTestViewTap.numberOfTouchesRequired = 1
        handleTestViewTap.numberOfTapsRequired = 1
        handleTestViewTap.delegate = self
        
        testImage.addGestureRecognizer(handleTestViewTap)
        
        self.addSubview(testImage)
        
        createTableView()
        
        self.tableViewList.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }
    
    func subViewsOfTestView(tapSender:UITapGestureRecognizer) {
        
        var location = tapSender.locationInView(tapSender.view)
//        println(location.x)
//        println(location.y)
        
        if ((location.x >= 51 && location.x <= 120) && (location.y >= 170 && location.y <= 241)) {
            
            println("TEST")
            
            self.items = ["Tool1", "Tool2"]
            self.headerTitle = "TEST"
            
            self.tableViewList.reloadData()
            
            fadeIn()
            
        } else if ((location.x >= 232 && location.x <= 325) && (location.y >= 54 && location.y <= 119)) {
            
            println("ADAPT")
            
            self.items = ["Tool1", "Tool2"]
            self.headerTitle = "ADAPT"
            
            self.tableViewList.reloadData()
            
            fadeIn()
            
        } else if ((location.x >= 209 && location.x <= 342) && (location.y >= 296 && location.y <= 351)) {
            
            println("PROTOTYPE")
            
            self.items = ["Tool1", "Tool2"]
            self.headerTitle = "PROTOTYPE"
            
            self.tableViewList.reloadData()
            
            fadeIn()
            
            
        } else {
            
            self.removeFromSuperview()
            
        }
        
        
        
        
        
        
    }
    
    func popUpTestView() {
        
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
        
        var showToolView = TestViewTool(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height))
        
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
