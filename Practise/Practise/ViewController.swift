//
//  ViewController.swift
//  Practise
//
//  Created by Anurita Srivastava on 07/04/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   lazy var myTableView : UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        
        return view
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .blue
        myTableView.register(CustomCell.self, forCellReuseIdentifier: "Cell")
        setupView()
        
    }

    func setupView(){
        view.addSubview(myTableView)
        myTableView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        myTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        myTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
    }

    func anime(){
        myTableView.reloadData()
        let cells = myTableView.visibleCells
        var delay: Double = 0
        for i in cells{
            i.transform = CGAffineTransform(translationX: 0, y: myTableView.frame.height)
            
        }
        for i in cells{
            
        UIView.animate(withDuration: 1.75, delay: delay*0.05, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            i.transform = CGAffineTransform.identity;
            delay += 1}, completion: nil)
    }
        

}
}


extension ViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // var cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = "something"
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        anime()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
