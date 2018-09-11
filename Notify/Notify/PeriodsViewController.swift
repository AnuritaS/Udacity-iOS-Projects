//
//  PeriodsViewController.swift
//  Notify
//
//  Created by Anurita Srivastava on 17/02/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit

class PeriodsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
self.tableView.separatorColor = UIColor.clear
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "PeriodsCell") as! PeriodsViewCell
        
        return cell
    }
}
