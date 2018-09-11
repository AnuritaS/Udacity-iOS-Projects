//
//  CollectionViewController.swift
//  Image Picker
//
//  Created by Anurita Srivastava on 09/01/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    var memes: [Meme]!
    
        override func viewDidLoad() {
        super.viewDidLoad()
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            memes = appDelegate.memes
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add , target: self, action: #selector(newMeme))

    }
    func newMeme(){
        let controller = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionCell
        let pic = memes[indexPath.row]
        
        cell.memeImage!.image = pic.memedImage
        return cell
    }

}
