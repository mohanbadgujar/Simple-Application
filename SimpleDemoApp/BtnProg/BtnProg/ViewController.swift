//
//  ViewController.swift
//  BtnProg
//
//  Created by BridgeLabz Solutions LLP  on 3/7/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createButton()
    }

    var goButton = UIButton()
    
    func createButton(){
        goButton.setTitle("Go", for: .normal)
        goButton.setTitleColor(UIColor.red, for: .normal)
        goButton.backgroundColor = UIColor.brown
        goButton.frame = CGRect(x: view.frame.width/2 - 50, y: view.frame.height/2 - 18, width:100, height:36)
        view.addSubview(goButton)
    }

}

