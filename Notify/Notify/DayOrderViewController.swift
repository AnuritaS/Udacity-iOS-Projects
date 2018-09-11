//
//  DayOrderViewController.swift
//  Notify
//
//  Created by Anurita Srivastava on 14/02/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit

class DayOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var DayOrders = ["DAY \r\nORDER","1","2","3","4","5"]
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
        return DayOrders.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "DayOrderCell") as!  CustomTableCell
        
        cell.DayOrder.text = DayOrders[indexPath.row]
        
        if indexPath.row == 0{
            cell.isUserInteractionEnabled = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Row \(indexPath.row) selected")
        
        let cell = tableView.cellForRow(at: indexPath) as! CustomTableCell
        
        var myBackView = UIView(frame: cell.frame)
         myBackView.backgroundColor = UIColor(red: 54/255, green: 54/255, blue: 54/255, alpha: 1)
        
        if(cell.isSelected){
            cell.selectedBackgroundView = myBackView
            cell.DayOrder.font = cell.DayOrder.font.withSize(25)
            
        }
            
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "PeriodsViewController") as! PeriodsViewController
        self.navigationController!.pushViewController(controller, animated: true)
    
}
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row) deselected")
        let cell = tableView.cellForRow(at: indexPath) as! CustomTableCell
        
        if(!cell.isSelected){
           
            cell.DayOrder.font = cell.DayOrder.font.withSize(17)
            
        }

    }
}
