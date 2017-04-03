//
//  MYOAViewController.swift
//  MYOA
//
//  Created by Anurita Srivastava on 08/01/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit

class MYOAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Over", style: .plain, target: self, action: #selector(startOver))        // Do any additional setup after loading the view.
    }

    func startOver(){
        if let navigationController = navigationController{
            navigationController.popToRootViewController(animated: true)
        }
    }

    
    
}
