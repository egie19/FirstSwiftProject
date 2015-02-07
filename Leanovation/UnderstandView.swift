//
//  UnderstandView.swift
//  Leanovation
//
//  Created by Lowiegie on 2/2/15.
//  Copyright (c) 2015 Eastvantage. All rights reserved.
//

import UIKit

class UnderstandView: UIView, UIGestureRecognizerDelegate, UIActionSheetDelegate, UITableViewDataSource, UITableViewDelegate {
    
//    var items: [String]!
    var items: [String] = ["None"]
    var headerTitle = ""
    let tableViewList = UITableView(frame: CGRectMake(10, 25, 400, 370), style: UITableViewStyle.Plain)
    var tableViewListContainer = UIView(frame: CGRectMake(15, 4, 435, 405))
//    var currentSelectedTool:String = ""
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        
        var understandImage = UIImageView(frame: CGRectMake(0, 0, 450, 400))
        understandImage.image = UIImage(named: "view2zoom")
        understandImage.contentMode = UIViewContentMode.ScaleAspectFit
        understandImage.userInteractionEnabled = true
        
        var handleUnderstandViewTap = UITapGestureRecognizer(target: self, action: "subViewsOfUnderstandView:")
        handleUnderstandViewTap.numberOfTouchesRequired = 1
        handleUnderstandViewTap.numberOfTapsRequired = 1
        handleUnderstandViewTap.delegate = self
        
        understandImage.addGestureRecognizer(handleUnderstandViewTap)

        self.addSubview(understandImage)
        
        createTableView()
        
        self.tableViewList.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        self.bringSubviewToFront(self.tableViewList)
        
    }
    
    
    func subViewsOfUnderstandView(tapSender:UITapGestureRecognizer) {
        
        println("SUBVIEWS OF UNDERSTAND")
        var location = tapSender.locationInView(tapSender.view)
        
        println(location.x)
        println(location.y)
        
        if ((location.x >= 104 && location.x <= 271) && (location.y >= 19 && location.y <= 130)){
            
            self.items = ["Business Model Canvas PDF", "Strategyzer", "Strategyzer Academy"]
            self.headerTitle = "BUSINESS MODEL"
            
            self.tableViewList.reloadData()
            
            println("BUSINESS MODEL")
            
            fadeIn()
            
            
            
            
        } else if ((location.x >= 286 && location.x <= 404) && (location.y >= 140 && location.y <= 224)){
            
            println("USER SEARCH")
            
            self.items = ["WiseHunch", "User Interviewer:looking for insights", "Standford's Empathy Map", "Beginner's Mindset", "User's Journey Mapping", "How to Interview"]
            
            self.headerTitle = "USER RESEARCH"
            
            
            self.tableViewList.reloadData()
            
            fadeIn()
            
            
        } else if ((location.x >= 104 && location.x <= 246) && (location.y >= 241 && location.y <= 340)){
            
            println("ECOSYSTEM MAPPING")
            
            self.items = ["SimilarWeb", "Tool2"]
            
            self.headerTitle = "ECOSYSTEM MAPPING"
            
            
            self.tableViewList.reloadData()
            
            fadeIn()
            
        } else {
            self.removeFromSuperview()
            
        }
        
        
//        self.removeFromSuperview()
        
    }
    
    func popUpUnderstandView() {
        
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
        
        var showToolView = UnderstandViewTool(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height))
        
//        showToolView.setHeaderTitle("Business Model Canvas PDF")
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
//        var vc = UIViewController()
//        
//        vc.view = self.tableViewList
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
