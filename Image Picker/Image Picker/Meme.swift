//
//  Meme.swift
//  Image Picker
//
//  Created by Anurita Srivastava on 09/01/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit

class Meme: UIViewController {
    
        var topText: String!
        var bottomText: String!
        var image: UIImage!
        var memedImage: UIImage!
        
        init(topText: String, bottomText: String, image: UIImage, memedImage: UIImage){
            super.init(nibName: nil, bundle: nil)
            self.topText = topText
            self.bottomText = bottomText
            self.image = image
            self.memedImage = memedImage

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
