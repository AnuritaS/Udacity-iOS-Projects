//
//  Feed.swift
//  theBulletin
//
//  Created by Anurita Srivastava on 05/02/17.
//  Copyright © 2017 Shubhankar Singh. All rights reserved.
//

import UIKit

class Feed: UIViewController,XMLParserDelegate {

    var parser = XMLParser()
    var strXMLData:String = ""
    var currentElement:String = ""
    var passData:Bool=false
    var passName:Bool=false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlName = "http://feed.androidauthority.com/"
        var url = URL(string: urlName)!
        
        // Do any additional setup after loading the view.
        
        parser = XMLParser(contentsOf: url)!
        parser.delegate = self
        
        if parser.parse(){
            print("parse success")
            print(strXMLData)
            
        }
        else{
            print("parse failure")
        }
    }

    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        currentElement=elementName;
        if elementName=="description" || elementName=="title"
        {
            if elementName=="title" {
                passName=true;
            }
            passData=true;
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        currentElement="";
        if elementName=="title" || elementName=="description"
        {
            if(elementName=="title"){
                passName=false;
            }
            passData=false;
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if(passName){
            strXMLData=strXMLData+"\n\n"+string
        }
        
        if(passData)
        {
            print(string)
        }
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("failure error: ", parseError)
    }
}

