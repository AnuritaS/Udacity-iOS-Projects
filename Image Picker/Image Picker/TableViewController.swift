//
//  TableViewController.swift
//  Image Picker
//
//  Created by Anurita Srivastava on 10/01/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var memes: [Meme]!
    //var newMeme = NewMemeDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tabBarController?.delegate = newMeme
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
             // Do any additional setup after loading the view.
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add , target: self, action: #selector(newMeme))

    }
    /*func newMeme(){
        let controller = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.pushViewController(controller, animated: true)
        
    }*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return memes.count
    }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")!
        let pic = memes[indexPath.row]
        cell.imageView?.image = pic.memedImage
        cell.textLabel?.text = pic.topText+pic.bottomText
        return cell
    }
    
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "")
    }*/
}
