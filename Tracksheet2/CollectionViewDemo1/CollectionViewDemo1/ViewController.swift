
//  ViewController.swift
//  Title : CollectionViewDemo

//  Created by Mohan Badgujar at BridgeLabz Solutions LLP  on 3/14/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.


import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    let identifier = "cellIdentifier"
   
    @IBOutlet weak var collectionView: UICollectionView!
    var images = ["Dog","Elephant","Lion","Zebra","Cat","pc","Dog","Elephant","Lion","Zebra","Cat","pc"]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! myCollectionViewCell
        
        cell.layer.cornerRadius = 50
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 2
        
        cell.myImageView.image = UIImage(named: images[indexPath.row])
        cell.myImageView.contentMode = .scaleAspectFill
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        print("Selected Row" ,indexPath.row)
        
        let vc:DetailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController

        vc.img = UIImage(named: self.images[indexPath.row])
  
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

