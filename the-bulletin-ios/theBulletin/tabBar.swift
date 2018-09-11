//
//  tabBar.swift
//  theBulletin
//
//  Created by Shubhankar Singh on 04/02/17.
//  Copyright © 2017 Shubhankar Singh. All rights reserved.
//

import UIKit

class tabBar: UITabBar {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 40
        return sizeThatFits
    }
}
