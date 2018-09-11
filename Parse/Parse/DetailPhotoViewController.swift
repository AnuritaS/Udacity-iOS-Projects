//
//  DetailPhotoViewController.swift
//  Parse
//
//  Created by Anurita Srivastava on 24/02/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit

class DetailPhotoViewController : UIViewController{
    
    @IBOutlet weak var picture: UIImageView!
    
    var detailPhotos : String!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let imageUrl = URL(string: detailPhotos)
        if let imageData = try? Data(contentsOf: imageUrl!){
            picture.image = UIImage(data: imageData)
        }else{
            print("no full image recieved from data")
        }
    }
    
    
   
    
    
}

