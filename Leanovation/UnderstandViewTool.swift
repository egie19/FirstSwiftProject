//
//  UnderstandViewTool.swift
//  Leanovation
//
//  Created by Lowiegie on 2/5/15.
//  Copyright (c) 2015 Eastvantage. All rights reserved.
//

import UIKit

class UnderstandViewTool: UIView, UIWebViewDelegate {
    
    var selectedModel:Int = 0
    var lineBorderPosition:CGFloat = 0.00
    var appUrl:String = ""
    var mainModelName = ""
    
    var loadingIndicator = UIActivityIndicatorView(frame: CGRectMake(190, 140, 20, 20))
    
    let common = Common()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.darkGrayColor()
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutIfNeeded() {
        
        var container = UIView(frame: CGRectMake(100, 100, 820, 600))
        container.backgroundColor = .whiteColor()
        self.addSubview(container)
        
        var businessModel = UnderstandViewModel(businessModelNumber: selectedModel, mainModelName: mainModelName)
        
        self.appUrl = businessModel.appUrlString
        
        
        // Close button
        
        var btnDelete = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        btnDelete.frame = CGRectMake(915, 72, 30, 30)
        btnDelete.setImage(UIImage(named: "close"), forState: .Normal)
        btnDelete.addTarget(self, action: "closeMenu:", forControlEvents: .TouchUpInside)
        
        self.addSubview(btnDelete)
        
        
        // Header Label

        var headerLabel = UILabel(frame: CGRectMake(100, 105, 820, 70))
        headerLabel.text = businessModel.getHeaderTitle()
        headerLabel.textAlignment = .Center
        headerLabel.font = UIFont.systemFontOfSize(25)
        headerLabel.textColor = .blackColor()
        self.addSubview(headerLabel)
        
        
        // Border line
        
        var line = UIView(frame: CGRectMake(100, 180, 820, 1))
        line.backgroundColor = UIColor.blackColor()

        self.addSubview(line)
    
        
        // Web View
        
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        loadingIndicator.hidesWhenStopped = true
        
        var webView = UIWebView(frame: CGRectMake(105, 190, 380, 280))
        webView.delegate = self
        webView.sizeToFit()
        webView.loadHTMLString(businessModel.embedHtmlString, baseURL: NSBundle.mainBundle().resourceURL)
        webView.addSubview(loadingIndicator)
        
        self.addSubview(webView)
        
        // Description
        
        var para1 = UILabel(frame: CGRectMake(155, 480, 660, 100))
        para1.text = businessModel.getLabelDescription()
        para1.numberOfLines = 4
        para1.textAlignment = .Center
        
        self.addSubview(para1)
        
        // Button Link
        
        var businessBtnLink = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        businessBtnLink.frame = CGRectMake(535, 330, 320, 70)
        
        businessBtnLink.backgroundColor = common.hexStringToUIColor("#46a9e0")
        businessBtnLink.setTitle(businessModel.getButtonLabel(), forState: .Normal)
        businessBtnLink.titleLabel?.numberOfLines = 2
        businessBtnLink.titleEdgeInsets = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 80)
        businessBtnLink.titleLabel?.textAlignment = .Center
        businessBtnLink.layer.cornerRadius = 8
        businessBtnLink.layer.masksToBounds = true
        
        var btnImage:UIImage = common.imageWithImage(UIImage(named: "forward")!, newSize: CGSize(width: 30, height: 30)) as UIImage
        businessBtnLink.setImage(btnImage, forState: .Normal)
        businessBtnLink.imageEdgeInsets = UIEdgeInsets(top: 0, left: 280, bottom: 0, right: 0)
        
        businessBtnLink.addTarget(self, action: "viewAppUrl:", forControlEvents: .TouchUpInside)
        
        self.addSubview(businessBtnLink)
        
    }
    
    
    
    func businessModelCanvasPDF() {
        
        
        println("businessModelCanvasPDF MODEL")
        
        
        
    }
    
    func viewAppUrl(event:AnyObject) {
        
        println("VIEW APP URL")
        var showAppView = ApplicationWebView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height))
        
        showAppView.setUrlString(appUrl)
        
        showAppView.layoutIfNeeded()
        self.addSubview(showAppView)
        
        
        
    }
    
    
    func closeMenu(event:AnyObject) {
        println("boooom")
        self.removeFromSuperview()
        
    }
    
    func setMainModelName(title:String) {
        
        self.mainModelName = title
    }

    
    func setModel(num:Int) {
        self.selectedModel = num
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        
        
        loadingIndicator.startAnimating()
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        loadingIndicator.stopAnimating()
    }

    

}
