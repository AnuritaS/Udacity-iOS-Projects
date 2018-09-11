//
//  CustomCell.swift
//  Practise
//
//  Created by Anurita Srivastava on 07/04/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit

class CustomCell : UITableViewCell{
    
    var pic : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
{
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(pic)
        pic.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pic.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        pic.topAnchor.constraint(equalTo: topAnchor).isActive = true
        pic.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        pic.image = #imageLiteral(resourceName: "add")
    }
}
