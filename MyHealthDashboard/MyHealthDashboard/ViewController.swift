//
//  ViewController.swift
//  MyHealthDashboard
//
//  Created by Anurita Srivastava on 08/04/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var weightProgress: UIProgressView!
    @IBOutlet weak var stepProgress: UIProgressView!
    @IBOutlet weak var stepLabel: UITextField!
    
    var logos = [#imageLiteral(resourceName: "weight"),#imageLiteral(resourceName: "food"), #imageLiteral(resourceName: "step")]
    
    var jsonActivity = [String:Any]()
    var jsonWeight = [String:Any]()
    
    var cellData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UITabBar.appearance().backgroundColor = .orange
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "exercise1"))
        weightProgress.transform = weightProgress.transform.scaledBy(x: 1, y: 2.5)
        stepProgress.transform = stepProgress.transform.scaledBy(x: 1, y: 2.5)
        parse()
        progress()
        tableData()
    }

    @IBAction func GoYesterDay(_ sender: Any) {
        day.text = "Yesterday"
       
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        cell.pic.image = logos[indexPath.row]
        cell.info.text = cellData[0]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

extension ViewController{
    func parse(){
        if let filePath = Bundle.main.path(forResource: "getDailyActivity", ofType: "json"), let data = NSData(contentsOfFile: filePath) {
            do {
                jsonActivity = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:Any]
                print("parsed activity")
               
               
            }
            catch {
                print("Cant get activity data")
            }
        }
        if let filePath = Bundle.main.path(forResource: "getWeight", ofType: "json"), let data = NSData(contentsOfFile: filePath) {
            do {
                jsonWeight = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:Any]
                print("parsed weight")
                    }
            catch {
                print("Cant get weight data")
            }
        }
        
    }
    
    func progress(){
        let activity  = jsonActivity["activities"] as! [String:Any]
        let steps = activity["steps"] as! Int

       let goals  = jsonActivity["goals"] as! [String:Any]
        let totalSteps = goals["steps"] as! Int
        stepProgress.setProgress(Float(steps)/10000, animated: true)
        var attrString = NSMutableAttributedString(string: "\(steps)/\(totalSteps) STEPS")
        attrString.setAttributes([NSFontAttributeName : UIFont.systemFont(ofSize: 20)], range: NSMakeRange(0,String(steps).characters.count))
       
       stepLabel.attributedText = attrString
        
    }
    
    func tableData(){
        let activity  = jsonActivity["activities"] as! [String:Any]
        let calory = activity["calories"] as! Int
        
        let goals  = jsonActivity["goals"] as! [String:Any]
        let CalorieOut = goals["caloriesOut"] as! Int
        
        var food = "\(calory) calories eaten, \(CalorieOut-calory) left"
        cellData.append(food)
    }
    
}
