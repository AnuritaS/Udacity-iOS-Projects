//
//  CustomCardViewTableViewCell.swift
//  theBulletin
//
//  Created by Shubhankar Singh on 04/02/17.
//  Copyright © 2017 Shubhankar Singh. All rights reserved.
//

import UIKit

class CustomCardView: UITableViewCell {
    
    
    //Outlets
    @IBOutlet weak var imageForCard: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descr: UILabel!
    @IBOutlet weak var tagg: UILabel!
    @IBAction func bookmarkCard(_ sender: Any) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
