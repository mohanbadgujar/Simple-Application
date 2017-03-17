//
//  LoginViewController.swift
//  LoginForm
//
//  Created by BridgeLabz Solutions LLP  on 3/15/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailtextfield: UITextField!
    
    @IBOutlet weak var passwordtextfield: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        //set background color of this view controller
        self.view.backgroundColor = UIColor.cyan
        
        //store true or false value
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        
        //print("Login" ,isUserLoggedIn)
        
        if(isUserLoggedIn)
        {
         //   self.performSegue(withIdentifier: "LoginForm", sender: self)
            let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginButton(_ sender: Any)
    {
        
        let userEmail = emailtextfield.text;
        let userPassword = passwordtextfield.text;
        
        
        //store value of username and password in another variable
        //let userDefaults = Foundation.UserDefaults.standard
        let useremailstored = UserDefaults.standard.string(forKey: "username_store")
        let userpasswordstored = UserDefaults.standard.string(forKey: "pass_store")
    
        
        //check username and password is correct
        if (userEmail?.isEqual(useremailstored))!
        {
            if (userPassword?.isEqual(userpasswordstored))!
            {
               UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
               UserDefaults.standard.synchronize()
                
                let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                
                self.navigationController?.pushViewController(vc, animated: true)
               
            }else
            {
            print("Your password is not correct")
            displayMyAlertMessage(userMessage: "Your password is not correct")
            }
        }
        else{
               print("Your username and password is not correct")
               displayMyAlertMessage(userMessage: "Your username and password is not correct")
            }
    }
    
    @IBAction func registratioButton(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegViewController") as! RegViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //display alert
    func displayMyAlertMessage(userMessage : String)
    {
        let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        present(myAlert, animated: true, completion: nil)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
