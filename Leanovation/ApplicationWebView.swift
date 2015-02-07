//
//  ApplicationWebView.swift
//  Leanovation
//
//  Created by Lowiegie on 2/6/15.
//  Copyright (c) 2015 Eastvantage. All rights reserved.
//

import UIKit

class ApplicationWebView: UIView, UIWebViewDelegate {
    
    
    var urlString: String = ""
    var loadingIndicator = UIActivityIndicatorView(frame: CGRectMake(515, 330, 20, 20))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .whiteColor()
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func layoutIfNeeded() {
        println("WEB APP")
        
        var toolBar = UIToolbar(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 70))
        
        var exitBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "closeWindow:")
        
        toolBar.setItems([exitBtn], animated: true)
        
        self.addSubview(toolBar)
        
        
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        loadingIndicator.hidesWhenStopped = true
        
        
        var appView = UIWebView(frame: CGRectMake(0, 71, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.height - 71))
        appView.delegate = self
        let url = NSURL(string: self.urlString)
        let request = NSURLRequest(URL: url!)
        appView.loadRequest(request)
        
        appView.addSubview(loadingIndicator)
        
        self.addSubview(appView)
        
        
        
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        
        
        loadingIndicator.startAnimating()
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        loadingIndicator.stopAnimating()
    }
    
    

    
    func closeWindow(sender:AnyObject) {
        
        println("CLOSE WINDOW")
        self.removeFromSuperview()
    }
    
    func setUrlString(theUrl:String) {
        
        self.urlString = theUrl
        
    }

    
    
    

}
