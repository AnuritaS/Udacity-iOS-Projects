//
//  ViewController.swift
//  ChatCollection
//
//  Created by Anurita Srivastava on 06/12/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource{


    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ReplyTextCell.self, forCellWithReuseIdentifier: "ReplyTextCell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
var a = ["String that you want to show in the label inside the cell gggghdhdhfd jfnfjfnjhgjh rkfdshkfgdhkfdsf dshfdghfgds dshfdsbfhdfhjdsgfhdsf","dfgkshsjkhfsjkhsjkfhdsjfhdsf","zbdnfbdnbvcxnmbvmnvbmnvbfsmnvbfvmncbvmnc","sdddsda","dhfdfdhfdf"]
    func calculateHeight(inString:String) -> CGFloat
    {
        let messageString = inString
        
        let rect : CGRect = messageString.boundingRect(with: CGSize(width: 300.0, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, context: nil)
        
        let requredSize:CGRect = rect
        return requredSize.height
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var flowLayout: UICollectionViewFlowLayout? = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)
        if indexPath.item % 3 == 0 {
            var cellWidth: Float? = (collectionView.frame.width - (flowLayout?.sectionInset.left + flowLayout?.sectionInset.right))
            return CGSize(width: CGFloat(cellWidth!), height: CGFloat(cellWidth! / 2))
        }
        else {
            var cellWidth: Float? = (collectionView.frame.width - ((flowLayout?.sectionInset.left)! + (flowLayout?.sectionInset.right)!) - (flowLayout?.minimumInteritemSpacing)!) / 2
            return CGSize(width: CGFloat(cellWidth!), height: CGFloat(cellWidth!))
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReplyTextCell", for: indexPath) as! ReplyTextCell
      cell.backgroundColor = UIColor.purple
       cell.messageL.text = a[indexPath.row]
    
        return cell
    }

}

