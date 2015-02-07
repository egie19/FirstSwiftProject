//
//  UnderstandViewModel.swift
//  Leanovation
//
//  Created by Lowiegie on 2/6/15.
//  Copyright (c) 2015 Eastvantage. All rights reserved.
//

import UIKit


class UnderstandViewModel {
    
    
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
        
        
        if (self.parentModelName == "BUSINESS MODEL") {
            setUpBusinessModel()
        } else if (self.parentModelName == "USER RESEARCH") {
            setUpUserResearch()
        } else if (self.parentModelName == "ECOSYSTEM MAPPING") {
            setUpEcosystemMapping()
        }
        
        
        
    }
    
    
    func setUpBusinessModel() {
        
        println("setUpBusinessModel")
        switch self.modelNumber {
            
        case 0:
            // BUSINESS MODEL CANVAS PDF
            self.embedHtmlString = "<!DOCTYPE html><html><head><style type=\"text/css\"> body { margin: 0; padding: 0; } body, html { height: 100%; width: 100%; } </style> </head> <body> <iframe id=\"player\" type=\"text/html\" width=\"100%\" height=\"100%\" src=\"http://www.youtube.com/embed/QoAOzMTLP5s?enablejsapi=1\" frameborder=\"0\"></iframe></body></html>"
            
            self.appUrlString = "http://www.businessmodelgeneration.com/canvas"
            
            self.labelDescription = "Your business model on one page\nThe Business Model Canvas, is a strategic management and\nentrepreneurial tool. It allows you to describe, design, challenge,\ninvent, and pivot your business model."
            
            self.buttonLabel = "GET Business Model Canvas PDF"
            
            self.headerTitle = "Business Model Canvas PDF"
            
        case 1:
            // STRATEGYZER
            self.embedHtmlString = "<!DOCTYPE html><html><head><style type=\"text/css\"> body { margin: 0; padding: 0; } body, html { height: 100%; width: 100%; } </style> </head> <body> <iframe id=\"player\" type=\"text/html\" width=\"100%\" height=\"100%\" src=\"http://vimeo.com/75610358?enablejsapi=1\" frameborder=\"0\"></iframe></body></html>"
            
            self.appUrlString = "https://strategyzer.com/build"
            
            self.labelDescription = "Your toolbox to build better Business Models."
            
            self.buttonLabel = "GET Strategyzer"
            
            self.headerTitle = "Strategyzer"
            
        case 2:
            // STRATEGYZER ACADEMY
            self.embedHtmlString = "<!DOCTYPE html><html><head><style type=\"text/css\"> body { margin: 0; padding: 0; } body, html { height: 100%; width: 100%; } </style> </head> <body> <iframe id=\"player\" type=\"text/html\" width=\"100%\" height=\"100%\" src=\"http://vimeo.com/75610358?enablejsapi=1\" frameborder=\"0\"></iframe></body></html>"
            
            self.appUrlString = "https://strategyzer.com/academy/course/business-models-that-work-and-value-propositions-that-sell/"
            
            self.labelDescription = "Business Models That Work & Value Propositions That Sell\nAn online course that will teach you how to design, test, and build\nBusiness Models and Value Propositions based on the methodology\npracticed by the world's leading organizations and ventures."
            
            self.buttonLabel = "GET Strategyzer Academy"
            
            self.headerTitle = "Strategyzer Academy"
            
        default:
            println("WALA")
            
        }
        
        
        
        
        
    }
    
    func setUpUserResearch() {
        
        println("setUpUserResearch")
        
        
        switch self.modelNumber {
            
        case 0:
            // WiseHunch
            self.embedHtmlString = "<!DOCTYPE html><html><head><style type=\"text/css\"> body { margin: 0; padding: 0; } body, html { height: 100%; width: 100%; } </style> </head> <body> <iframe id=\"player\" type=\"text/html\" width=\"100%\" height=\"100%\" src=\"http://www.youtube.com/embed/v=LPwO-vOVxD4?enablejsapi=1\" frameborder=\"0\"></iframe></body></html>"
            
            self.appUrlString = "https://itunes.apple.com/us/app/wisehunch/id592348489?mt=8"
            
            self.labelDescription = "ASK THE RIGHT QUESTIONS, BUILD THE RIGHT PRODUCTS."
            
            self.buttonLabel = "GET WiseHunch"
            
            self.headerTitle = "WiseHunch"
            
        case 1:
            // User Interview: looking for insights
            self.embedHtmlString = "<!DOCTYPE html><html><head><style type=\"text/css\"> body { margin: 0; padding: 0; } body, html { height: 100%; width: 100%; } </style> </head> <body> <iframe id=\"player\" type=\"text/html\" width=\"100%\" height=\"100%\" src=\"http://startupweekend.wistia.com/medias/pyrarw4soy?enablejsapi=1\" frameborder=\"0\"></iframe></body></html>"
            
            self.appUrlString = "https://itunes.apple.com/us/app/audio-memos-free-voice-recorder/id304075033?mt=8#"
            
            self.labelDescription = "Audio Memos is a voice recorder for the iPhone and iPad."
            
            self.buttonLabel = "GET User Interview: looking for insights"
            
            self.headerTitle = "User Interview: looking for insights"
            
        case 2:
            // Stanford's Empathy Map
            self.embedHtmlString = "<!DOCTYPE html><html><head><style type=\"text/css\"> body { margin: 0; padding: 0; } body, html { height: 100%; width: 100%; } </style> </head> <body> <iframe id=\"player\" type=\"text/html\" width=\"100%\" height=\"100%\" src=\"http://vimeo.com/78569959?enablejsapi=1\" frameborder=\"0\"></iframe></body></html>"
            
            self.appUrlString = "http://www.businessmodelgeneration.com/canvas"
            
            self.labelDescription = ""
            
            self.buttonLabel = "GET Stanford's Empathy Map"
            
            self.headerTitle = "Stanford's Empathy Map"
            
        case 3:
            // Beginner's Mindset
            self.embedHtmlString = "<!DOCTYPE html><html><head><style type=\"text/css\"> body { margin: 0; padding: 0; } body, html { height: 100%; width: 100%; } </style> </head> <body> <iframe id=\"player\" type=\"text/html\" width=\"100%\" height=\"100%\" src=\"http://vimeo.com/78551898?enablejsapi=1\" frameborder=\"0\"></iframe></body></html>"
            
            self.appUrlString = "http://www.businessmodelgeneration.com/canvas"
            
            self.labelDescription = ""
            
            self.buttonLabel = "GET Beginner's Mindset"
            
            self.headerTitle = "Beginner's Mindset"
            
        case 4:
            // User's Journey Mapping
            self.embedHtmlString = "<!DOCTYPE html><html><head><style type=\"text/css\"> body { margin: 0; padding: 0; } body, html { height: 100%; width: 100%; } </style> </head> <body> <iframe id=\"player\" type=\"text/html\" width=\"100%\" height=\"100%\" src=\"http://vimeo.com/78554759?enablejsapi=1\" frameborder=\"0\"></iframe></body></html>"
            
            self.appUrlString = "https://itunes.apple.com/us/app/journeys-customer-experience/id821605133?mt=8"
            
            self.labelDescription = "In an increasingly digital world"
            
            self.buttonLabel = "GET User's Journey Mapping"
            
            self.headerTitle = "User's Journey Mapping"
            
        case 5:
            // How to interview
            self.embedHtmlString = "<!DOCTYPE html><html><head><style type=\"text/css\"> body { margin: 0; padding: 0; } body, html { height: 100%; width: 100%; } </style> </head> <body> <iframe id=\"player\" type=\"text/html\" width=\"100%\" height=\"100%\" src=\"http://vimeo.com/28128029?enablejsapi=1\" frameborder=\"0\"></iframe></body></html>"
            
            self.appUrlString = "https://docs.google.com/file/d/0B5_hlcsbNUS4YzdlMTk3OTgtNDM5MC00YmMyLWEyM2QtYWU4YTJhNmU2NTZj/edit"
            
            self.labelDescription = ""
            
            self.buttonLabel = "GET How to interview"
            
            self.headerTitle = "How to interview"
            
            
            
            
            
        default:
            println("WALA")
            
        }
        
        
        
        
        
    }
    
    func setUpEcosystemMapping() {
        
        println("setUpEcosystemMapping")
        
        switch self.modelNumber {
            
        case 0:
            // SimilarWeb
            self.embedHtmlString = "<!DOCTYPE html><html><head><style type=\"text/css\"> body { margin: 0; padding: 0; } body, html { height: 100%; width: 100%; } </style> </head> <body> <iframe id=\"player\" type=\"text/html\" width=\"100%\" height=\"100%\" src=\"http://www.youtube.com/embed/v=ou07kxofq0E?enablejsapi=1\" frameborder=\"0\"></iframe></body></html>"
            
            self.appUrlString = "http://www.similarweb.com"
            
            self.labelDescription = "Discover what your competition is doing online with SimilarWeb"
            
            self.buttonLabel = "GET SimilarWeb"
            
            self.headerTitle = "SimilarWeb"
            
        case 1:
            // Tool2
            self.embedHtmlString = "<!DOCTYPE html><html><head><style type=\"text/css\"> body { margin: 0; padding: 0; } body, html { height: 100%; width: 100%; } </style> </head> <body> <iframe id=\"player\" type=\"text/html\" width=\"100%\" height=\"100%\" src=\"http://www.youtube.com/embed/Rva9ylPHi2w?enablejsapi=1\" frameborder=\"0\"></iframe></body></html>"
            
            self.appUrlString = "http://www.businessmodelgeneration.com/canvas"
            
            self.labelDescription = "Discover what your competition is doing."
            
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
