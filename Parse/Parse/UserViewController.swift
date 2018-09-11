//
//  UserViewController.swift
//  Parse
//
//  Created by Anurita Srivastava on 24/02/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit

class UserViewController: UITableViewController {

    var User : [ViewController.Users]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(User.count)
      return User.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell")
        return cell!
    }

}
