//
//  PhotosCollection.swift
//  Parse
//
//  Created by Anurita Srivastava on 24/02/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit

extension PhotosViewController: UICollectionViewDelegate ,UICollectionViewDataSource{

   
    
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return photosArray.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThumbnailCell", for: indexPath) as! ThumbnailViewCell
    
    let imageUrlString = photosArray[indexPath.row].thumbnailUrl
    let imageUrl = URL(string: imageUrlString)
    DispatchQueue.global().async(execute: {
     if let imageData = try? Data(contentsOf: imageUrl!){
        DispatchQueue.main.async(execute :{
        cell.thumbnail.image = UIImage(data: imageData)
    })
     }
    else{
        print("no image received from data")
    }

    })
    
    
    
    
    return cell
}
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailPhoto") as! DetailPhotoViewController
                controller.detailPhotos = self.photosArray[indexPath.row].url
        navigationController?.pushViewController(controller, animated: true)
    }

}
