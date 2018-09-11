//
//  ReplyTextCell.swift
//  ChatCollection
//
//  Created by Anurita Srivastava on 06/12/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//


import UIKit

class ReplyTextCell : UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
          setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var userL : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        view.textAlignment = .left
        view.textColor = UIColor.black
        view.text = "HEYYYYYY"
        return view
    }()
    
    lazy var messageL : UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor.black
        view.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
        view.textAlignment = .left
        view.isScrollEnabled = false
        view.isUserInteractionEnabled = false
        view.isEditable = false
       
        return view
    }()
    
    lazy var timeL : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor.black
        view.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        view.textAlignment = .right
        view.text = "HEYYYYYY"
        return view
    }()
   
    
    func setupView(){
        
        addSubview(timeL)
        timeL.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        timeL.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        timeL.sizeToFit()
        
        addSubview(userL)
        userL.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        userL.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        userL.rightAnchor.constraint(equalTo: timeL.leftAnchor, constant: -20).isActive = true
        userL.sizeToFit()
        
        addSubview(messageL)
        messageL.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        messageL.topAnchor.constraint(equalTo: userL.bottomAnchor, constant: 5).isActive = true
        messageL.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        messageL.sizeToFit()
   
        
    }
    
}

