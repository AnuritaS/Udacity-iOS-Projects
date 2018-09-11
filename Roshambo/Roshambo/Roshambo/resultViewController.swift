//
//  resultViewController.swift
//  Roshambo
//
//  Created by Anurita Srivastava on 25/12/16.
//  Copyright © 2016 Anurita Srivastava. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {

    @IBOutlet weak var Result: UILabel!
    @IBOutlet weak var win: UIImageView!
    
    var user = String()
    var output: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func check(_ user: String)->String{
        let ch = ["Rock","Paper","Scissors"]
        let no = Int(arc4random()%3)
        let opponent = ch[no]
        let matchup = "\(user) vs. \(opponent)."
        var result = String()
        
        switch(user, opponent){
        case let (user, opponent) where user == opponent:
            result = "\(matchup) It's a tie"
            win.image = #imageLiteral(resourceName: "tie")

        case ("Rock","Scissors"),("Paper","Rock"),("Scissors","Paper"):
            result = "\(matchup) You win!"
            win.image = UIImage(named: "\(user)-\(opponent)")

        case ("Rock","Paper"),("Paper","Scissors"),("Scissors","Rock"):
            result = "\(matchup) You lose!"
            win.image = UIImage(named: "\(opponent)-\(user)")
            
        default:
            result = "Wrong choice!"
        }
       
        return result
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
        output = check(user)
        if let output = self.output{
            Result.text = output
        }else{
            Result.text = nil
            win.image = nil
        }
    }


    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


