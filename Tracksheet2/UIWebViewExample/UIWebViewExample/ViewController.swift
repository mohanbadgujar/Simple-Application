//
//  ViewController.swift
//  UIWebViewExample
//
//  Created by Mohan Badgujar at BridgeLabz Solutions LLP  on 3/10/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate
{
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        webView.delegate = self
        let url = NSURL (string: "http://www.google.com");
        let requestObj = NSURLRequest(url: url as! URL);
        webView.loadRequest(requestObj as URLRequest);
        
        
        //UIWebView load local html
        
        //let localfilePath = Bundle.main.url(forResource: "home", withExtension: "html");
        //let myRequest = NSURLRequest(url: localfilePath!);
        //webView.loadRequest(myRequest as URLRequest);
    }

    @IBAction func back(_ sender: Any)
    {
        webView.goBack()
    }
    
    @IBAction func forword(_ sender: Any)
    {
        webView.goForward()
    }
    
    @IBAction func reload(_ sender: Any)
    {
        webView.reload()
    }
    
    @IBAction func stopLoading(_ sender: Any)
    {
        webView.stopLoading()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

