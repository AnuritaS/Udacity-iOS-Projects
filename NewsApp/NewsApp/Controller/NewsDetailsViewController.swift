//
//  NewsDetailsViewController.swift
//  NewsApp
//
//  Created by Anurita Srivastava on 11/09/18.
//  Copyright © 2018 Anurita Srivastava. All rights reserved.
//

import UIKit
import CoreData

class NewsDetailsViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var desc: UITextView!
    
    var dataControl: DataController!
    var news: News!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }

    func setupView(){
        desc.text = news.descriptionField
        image.loadImageUsingCacheWithURLString(news.urlToImage ?? "", placeHolder: #imageLiteral(resourceName: "Arrow right"))
    }

}
