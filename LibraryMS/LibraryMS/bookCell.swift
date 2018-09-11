//
//  bookCell.swift
//  LibraryMS
//
//  Created by Anurita Srivastava on 27/08/18.
//  Copyright © 2018 Anurita Srivastava. All rights reserved.
//

import UIKit

class bookCell: UITableViewCell{
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var assigned: UILabel!
    var assign: Bool = false
    
}
