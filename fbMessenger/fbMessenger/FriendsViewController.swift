//
//  FriendsViewController.swift
//  fbMessenger
//
//  Created by Anurita Srivastava on 05/04/18.
//  Copyright © 2018 Anurita Srivastava. All rights reserved.
//

import UIKit

class FriendsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private var cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(FriendCell.self, forCellWithReuseIdentifier: cellId)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }

}

class FriendCell: BaseCell{
 
    let profileImage : UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
    let dividerLine : UIView = {
        let view = UIView()
       view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
  override func setupView(){
  
    addSubview(profileImage)
    addSubview(dividerLine)
    
    profileImage.image = UIImage(named: "profile")
    constraints(format: "H:|-12-[v0(40)]", views: profileImage)
    constraints(format: "V:[v0(40)]", views: profileImage)
    addConstraint(NSLayoutConstraint(item: profileImage, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    
    constraints(format: "H:|-64-[v0]|", views: dividerLine)
    constraints(format: "V:[v0(1)]|", views: dividerLine)
  
    }
}
extension UIView{
    
    func constraints(format: String, views: UIView...){
        
        var viewsDict = [String:Any]()
        for (index,view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDict[key] = view
        }
        
         addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict))
    }
}
class BaseCell : UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        backgroundColor = UIColor.blue
    }
}

