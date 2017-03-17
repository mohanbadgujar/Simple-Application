//
//  ViewController.swift
//  MultiTouch
//
//  Created by BridgeLabz Solutions LLP  on 2/25/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIGestureRecognizerDelegate
    {

    let imagePicker = UIImagePickerController()

    @IBOutlet weak var loadimg: UIButton!
    
    let mysound:SystemSoundID = 1010
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imagePicker.delegate = self
        loadimg.layer.cornerRadius = 15
    }
    
    @IBAction func loadImgAction(_ sender: UIButton)
    {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated:true, completion: nil)
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any])
    {
        //add sub image axis
        let imgview = UIImageView(frame: CGRect(x:Int(arc4random_uniform(240)), y: Int(arc4random_uniform(300)), width: 90, height: 90))
        
        //create gesture
        let pangesture = UIPanGestureRecognizer(target: self, action:#selector(getGesture))
        
        //add image view as a subview on a current view
        if let pickedImg = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            imgview.image = pickedImg
        }
        
        pangesture.delegate = self;
        
        //set user intraction true
        imgview.isUserInteractionEnabled = true;
        
        
        //add gesture on img
        imgview.addGestureRecognizer(pangesture)
        
        
        dismiss(animated: true, completion:{
            self.view.addSubview(imgview)
            AudioServicesPlaySystemSound(self.mysound)
            })
        
        }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //Gesture is called
    func getGesture(pangesture:UIPanGestureRecognizer)
    {
        let newpoint:CGPoint = pangesture.location(in: self.view)
        self.view?.bringSubview(toFront: pangesture.view!)
        pangesture.view?.center = newpoint
    }
    
}

