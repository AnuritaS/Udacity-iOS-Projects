//
//  studentCell.swift
//  LibraryManagementSystem
//
//  Created by Anurita Srivastava on 11/09/18.
//  Copyright © 2018 Anurita Srivastava. All rights reserved.
//

import UIKit

class studentCell: UITableViewCell {

    @IBOutlet weak var regId: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var books: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
