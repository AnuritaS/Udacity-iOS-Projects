//
//  ViewController.swift
//  MyFitnessDashboard
//
//  Created by Anurita Srivastava on 08/04/17.
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
    
    lazy var myView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        setupView()
     
    }

   

    func setupView(){
        
        view.addSubview(myView)
        myView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 30).isActive = true
        myView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 3).isActive = true
        myView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -3).isActive = true
        myView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -20).isActive = true
        
        view.addSubview(myTableView)
        myTableView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 20).isActive = true
         myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
         myTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 3).isActive = true
        myTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -3).isActive = true
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "some"
        return cell
    }
}
