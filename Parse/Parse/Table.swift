//
//  Table.swift
//  Parse
//
//  Created by Anurita Srivastava on 23/02/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import Foundation
import UIKit
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
        return  allUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let user = self.allUsers[indexPath.row]
        cell?.textLabel?.text = user.name
        cell?.detailTextLabel?.text = user.username
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SingleUserView") as! UserViewController
        controller.User = [self.allUsers[indexPath.row]]
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
