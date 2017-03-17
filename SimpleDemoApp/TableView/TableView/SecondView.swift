//
//  SecondView.swift
//  TableView
//
//  Created by BridgeLabz Solutions LLP  on 3/1/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class SecondView: UIViewController
{
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    var pimage:UIImage!
    var pname:String!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imageView.image = pimage
        name.text = pname
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        // Do any additional setup after loading the view.
    }
}
