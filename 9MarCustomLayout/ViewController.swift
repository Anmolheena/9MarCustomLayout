//
//  ViewController.swift
//  9MarCustomLayout
//
//  Created by Appinventiv-PC on 09/03/18.
//  Copyright © 2018 Appinventiv-PC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    var GalleryArray:[UIImage] = []
    @IBOutlet weak var CollectionViewOutlet: UICollectionView!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = CollectionViewOutlet?.collectionViewLayout as? CustomLayoutClass
        
        layout?.delegate = self
       
    
        for i in 1...15
        {
            GalleryArray.append(UIImage(named: "\(i).jpg") ?? #imageLiteral(resourceName: "1.jpg"))
        }
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension ViewController : UICollectionViewDataSource,UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GalleryArray.count
        
    }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = CollectionViewOutlet.dequeueReusableCell(withReuseIdentifier: "cell1" , for: indexPath) as! collectionViewCellClassCollectionViewCell
          cell.ImageOutletInCellClass.image = UIImage(cgImage: GalleryArray[indexPath.row].cgImage!)
        return cell
    }
 
        func collectionView(_ collectionView: UICollectionView,
                            heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
            
            return GalleryArray[indexPath.item].size.height
        }
    }



