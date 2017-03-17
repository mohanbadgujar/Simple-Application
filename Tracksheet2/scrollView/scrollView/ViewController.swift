//
//  ViewController.swift
//  scrollView
//
//  Created by BridgeLabz Solutions LLP  on 3/11/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit
    let imageView = UIImageView()

class ViewController:UIViewController,UIGestureRecognizerDelegate,UIScrollViewDelegate
{
    
    @IBOutlet weak var myScrollView: UIScrollView!
   
    var myArray = [UIImage]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       // myScrollView.delegate = self
        myScrollView.frame = view.frame
        
        myArray = [#imageLiteral(resourceName: "Lion"),#imageLiteral(resourceName: "Elephant"),#imageLiteral(resourceName: "Zebra"),#imageLiteral(resourceName: "Cat"),#imageLiteral(resourceName: "pc"),#imageLiteral(resourceName: "Dog")]
    
        for i in 0..<myArray.count
        {
            print(i)
            
            let imageView = UIImageView()
            imageView.image = myArray[i]
            let xpos = self.view.frame.width * CGFloat(i)
           
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x:xpos,y:0, width:self.myScrollView.frame.width, height:self.myScrollView.frame.height)
         
            myScrollView.contentSize.width = myScrollView.frame.width * CGFloat(i)
            myScrollView.addSubview(imageView)
            view.addSubview(myScrollView)
            setupGestureRecognizer()
            setZoomScale()
            
//          myScrollView.delegate = self
//          myScrollView.minimumZoomScale = 0.1
//          myScrollView.maximumZoomScale = 4.0
//          myScrollView.zoomScale = 1.0

        }
    }
    

    func viewForZooming(in myScrollView: UIScrollView) -> UIView?
    {
        return imageView
    }
    
    func setZoomScale()
    {
        let imageViewSize = imageView.bounds.size
        let scrollViewSize = myScrollView.bounds.size
        let widthScale = scrollViewSize.width / imageViewSize.width
        let hightScale = scrollViewSize.height / imageViewSize.height
        myScrollView.minimumZoomScale = min(widthScale, hightScale)
        myScrollView.zoomScale = 1.0
    }
   
    
    //MARK: scale image when orientation change
    override func viewWillLayoutSubviews()
    {
        setZoomScale()
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView)
    {
        let imageViewSize = imageView.frame.size
        let scrollViewSize = myScrollView.bounds.size
        let verticlePadding = imageViewSize.height<scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height)/2 : 0
        let horizontalPadding = imageViewSize.width<scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width)/2 :0
        myScrollView.contentInset = UIEdgeInsets(top: verticlePadding, left: horizontalPadding, bottom: verticlePadding, right: horizontalPadding)
    }
    
    func setupGestureRecognizer()
    {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        doubleTap.delegate = self
        
        doubleTap.numberOfTapsRequired = 2
        myScrollView.isUserInteractionEnabled = true
        myScrollView.addGestureRecognizer(doubleTap)
    }
    
    func handleDoubleTap(recognizer: UITapGestureRecognizer)
    {
        if (myScrollView.zoomScale > myScrollView.minimumZoomScale)
        {
             myScrollView.setZoomScale(myScrollView.minimumZoomScale, animated: true)
        } else
        {
            myScrollView.setZoomScale(myScrollView.maximumZoomScale, animated: true)
        }
    }
}
 

