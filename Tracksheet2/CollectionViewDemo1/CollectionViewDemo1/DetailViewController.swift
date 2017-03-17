//
//  DetailViewController.swift
//  CollectionViewDemo1
//
//  Created by BridgeLabz Solutions LLP  on 3/14/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    let imageView = UIImageView()
    var img:UIImage?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        imageView.image = img
        self.view.addSubview(imageView)
    }
}
