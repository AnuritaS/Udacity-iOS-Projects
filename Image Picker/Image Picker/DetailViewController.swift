//
//  DetailViewController.swift
//  Image Picker
//
//  Created by Anurita Srivastava on 11/01/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var savedMeme: UIImageView!
    var memes: [Meme]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
    
        super.viewWillAppear(animated)
        //self.savedMeme!.image = self.memes.
        // Dispose of any resources that can be recreated.
    }
    

   }
