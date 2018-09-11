//
//  ViewController.swift
//  theBulletin
//
//  Created by Shubhankar Singh on 04/02/17.
//  Copyright © 2017 Shubhankar Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Variables
    var mainTitle = ["Milan is over, we are heartbroken.","Weekly Roundup: 25th February 2017"]
    var descrText = ["So here’s a collection of some of the best moments at Milan this year", "From the Under 17 FIFA World Cup to the mishaps at the White House, we’ve got you covered."]
    var taggText = ["COLLEGE","WEEKLY"]
    
    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCardView
        cell.title.text = mainTitle[indexPath.row]
        cell.descr.text = descrText[indexPath.row]
        cell.tagg.text = taggText[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

