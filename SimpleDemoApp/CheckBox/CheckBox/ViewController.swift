//
//  ViewController.swift
//  CheckBox
//
//  Created by BridgeLabz Solutions LLP  on 3/8/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var boxOne: UIButton!
    
    @IBOutlet weak var boxTwo: UIButton!
    
    let BoxOn = UIImage(named: "Checked")
    let BoxOff = UIImage(named: "Unchecked")
    var IsBoxClicked:Bool = false
    
    let BoxOn1 = UIImage(named: "radiocheck")
    let BoxOff1 = UIImage(named: "radiouncheck")
    var IsRadioBoxClicked:Bool = false
    
    override func viewDidLoad(){
        super.viewDidLoad()
//        boxOne.setImage(BoxOn, for: .selected)
//        boxOne.setImage(BoxOff, for: .normal)
    }

    @IBAction func radioButton(_ sender: Any)
    {
        
        boxOne.setImage(BoxOn, for: .selected)
        boxOne.setImage(BoxOff, for: .normal)
//        if IsRadioBoxClicked == true
//        {
//            boxTwo.setImage(BoxOn1, for: .normal)
//            self.view.backgroundColor = UIColor.red
//            IsRadioBoxClicked = false
//        }else if IsRadioBoxClicked ==  false
//        {
//            boxTwo.setImage(BoxOff1, for: .normal)
//            self.view.backgroundColor = UIColor.white
//            IsRadioBoxClicked = true
//        }
    }
    @IBAction func checkBox(_ sender: Any)
    {
//       if IsBoxClicked == true
//        {
//           boxOne.setImage(BoxOn, for: .normal)
//           self.view.backgroundColor = UIColor.red
//           IsBoxClicked = false
//        }else if IsBoxClicked ==  false
//        {
//            boxOne.setImage(BoxOff, for: .normal)
//            self.view.backgroundColor = UIColor.white
//            IsBoxClicked = true
//        }
        
   }
}

