//
//  tabBar.swift
//  theBulletin
//
//  Created by Anurita Srivastava on 04/02/17.
//  Copyright © 2017 Shubhankar Singh. All rights reserved.
//

import UIKit

class tabBar: UITabBar {
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 70
        
        return sizeThatFits
    }
    
}
