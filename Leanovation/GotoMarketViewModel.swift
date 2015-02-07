//
//  GotoMarketViewModel.swift
//  Leanovation
//
//  Created by Lowiegie on 2/6/15.
//  Copyright (c) 2015 Eastvantage. All rights reserved.
//

import Foundation

class GotoMarketViewModel {
    
    var embedHtmlString:String!
    var appUrlString:String!
    var labelDescription:String!
    var buttonLabel:String!
    var headerTitle:String!
    
    var modelNumber:Int = 0
    var parentModelName:String = ""
    
    
    init(businessModelNumber:Int, mainModelName:String) {
        
        self.modelNumber = businessModelNumber
        self.parentModelName = mainModelName
        
        
        if (self.parentModelName == "GO TO MARKET") {
            setUpGotoMarket()
        } else if (self.parentModelName == "INTEGRATE") {
            setUpIntegrate()
        } else if (self.parentModelName == "DEVELOP") {
            setUpDevelop()
        }
        
        
    }
    
    
    func setUpGotoMarket() {
        
        switch self.modelNumber {
            
        case 0:
            // SimilarWeb
            self.embedHtmlString = "<!DOCTYPE html><html><head><style type=\"text/css\"> body { margin: 0; padding: 0; } body, html { height: 100%; width: 100%; } </style> </head> <body> <iframe id=\"player\" type=\"text/html\" width=\"100%\" height=\"100%\" src=\"http://www.youtube.com/embed/v=ou07kxofq0E?enablejsapi=1\" frameborder=\"0\"></iframe></body></html>"
            
            self.appUrlString = "http://www.similarweb.com"
            
            self.labelDescription = "Lorem ipsum dolor sit amet"
            
            self.buttonLabel = "GET Tool1"
            
            self.headerTitle = "Tool1"
            
        case 1:
            // Tool2
            self.embedHtmlString = "<!DOCTYPE html><html><head><style type=\"text/css\"> body { margin: 0; padding: 0; } body, html { height: 100%; width: 100%; } </style> </head> <body> <iframe id=\"player\" type=\"text/html\" width=\"100%\" height=\"100%\" src=\"http://www.youtube.com/embed/Rva9ylPHi2w?enablejsapi=1\" frameborder=\"0\"></iframe></body></html>"
            
            self.appUrlString = "http://www.businessmodelgeneration.com/canvas"
            
            self.labelDescription = "Lorem ipsum dolor sit amet"
            
            self.buttonLabel = "GET Tool2"
            
            self.headerTitle = "Tool2"
            
            
        default:
            println("WALA")
            
        }
        
        
    }
    
    func setUpIntegrate() {
        
        switch self.modelNumber {
            
        case 0:
            // SimilarWeb
            self.embedHtmlString = "<!DOCTYPE html><html><head><style type=\"text/css\"> body { margin: 0; padding: 0; } body, html { height: 100%; width: 100%; } </style> </head> <body> <iframe id=\"player\" type=\"text/html\" width=\"100%\" height=\"100%\" src=\"http://www.youtube.com/embed/v=ou07kxofq0E?enablejsapi=1\" frameborder=\"0\"></iframe></body></html>"
            
            self.appUrlString = "http://www.similarweb.com"
            
            self.labelDescription = "Lorem ipsum dolor sit amet"
            
            self.buttonLabel = "GET Tool1"
            
            self.headerTitle = "Tool1"
            
        case 1:
            // Tool2
            self.embedHtmlString = "<!DOCTYPE html><html><head><style type=\"text/css\"> body { margin: 0; padding: 0; } body, html { height: 100%; width: 100%; } </style> </head> <body> <iframe id=\"player\" type=\"text/html\" width=\"100%\" height=\"100%\" src=\"http://www.youtube.com/embed/Rva9ylPHi2w?enablejsapi=1\" frameborder=\"0\"></iframe></body></html>"
            
            self.appUrlString = "http://www.businessmodelgeneration.com/canvas"
            
            self.labelDescription = "Lorem ipsum dolor sit amet"
            
            self.buttonLabel = "GET Tool2"
            
            self.headerTitle = "Tool2"
            
            
        default:
            println("WALA")
            
        }
        
        
        
        
    }
    
    func setUpDevelop() {
        
        switch self.modelNumber {
            
        case 0:
            // SimilarWeb
            self.embedHtmlString = "<!DOCTYPE html><html><head><style type=\"text/css\"> body { margin: 0; padding: 0; } body, html { height: 100%; width: 100%; } </style> </head> <body> <iframe id=\"player\" type=\"text/html\" width=\"100%\" height=\"100%\" src=\"http://www.youtube.com/embed/v=ou07kxofq0E?enablejsapi=1\" frameborder=\"0\"></iframe></body></html>"
            
            self.appUrlString = "http://www.similarweb.com"
            
            self.labelDescription = "Lorem ipsum dolor sit amet"
            
            self.buttonLabel = "GET Tool1"
            
            self.headerTitle = "Tool1"
            
        case 1:
            // Tool2
            self.embedHtmlString = "<!DOCTYPE html><html><head><style type=\"text/css\"> body { margin: 0; padding: 0; } body, html { height: 100%; width: 100%; } </style> </head> <body> <iframe id=\"player\" type=\"text/html\" width=\"100%\" height=\"100%\" src=\"http://www.youtube.com/embed/Rva9ylPHi2w?enablejsapi=1\" frameborder=\"0\"></iframe></body></html>"
            
            self.appUrlString = "http://www.businessmodelgeneration.com/canvas"
            
            self.labelDescription = "Lorem ipsum dolor sit amet"
            
            self.buttonLabel = "GET Tool2"
            
            self.headerTitle = "Tool2"
            
            
        default:
            println("WALA")
            
        }
        
        
    }
    
    func getEmbedHtmlString()->String {
        return self.embedHtmlString
    }
    
    func getAppUrlString()->String {
        return self.appUrlString
    }
    
    func getButtonLabel()->String {
        return self.buttonLabel
    }
    
    func getLabelDescription()->String {
        return self.labelDescription
    }
    
    func getHeaderTitle()->String {
        return self.headerTitle
    }
    
    
    
    
    
    
}
