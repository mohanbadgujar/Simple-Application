//
//  RegViewController.swift
//  LoginForm
//
//  Created by BridgeLabz Solutions LLP  on 3/15/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class RegViewController: UIViewController {

    @IBOutlet weak var emailreg: UITextField!
    
    @IBOutlet weak var passreg: UITextField!
    
    @IBOutlet weak var repassreg: UITextField!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //set background color of RegViewController
        self.view.backgroundColor = UIColor.cyan
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func register(_ sender: Any)
    {
        let username_store = emailreg.text;
        let pass_store = passreg.text;
        let repass_store = repassreg.text;
        
        //check for empty fields
        if (username_store?.isEmpty)! || (pass_store?.isEmpty)! || (repass_store?.isEmpty)!
        {
           displayMyAlertMessage(userMessage: "All fields are required")
           print("insert all value")
           return
        }
        
        //check password and repeated password match
        if pass_store != repass_store
        {
           displayMyAlertMessage(userMessage: "Repeated password do not match")
           print("username and password not same")
           return
        }
        
        //Validate Email
        let isEmailAddressValid = isValidEmailAddress(emailAddressString: username_store!)
        
        if isEmailAddressValid
        {
            print("Email address is valid")
        } else {
            print("Email address is not valid")
            displayMyAlertMessage(userMessage: "Email address is not valid")
        }
        
        //Validate Password
        let isPasswordValid = isValidPassword(passswordString: pass_store!)
        
        if isPasswordValid
        {
            print("Password is valid")
        } else {
            print("Password is not valid")
            displayMyAlertMessage(userMessage: "Password is not valid")
        }
    
        
        //store data
        UserDefaults.standard.set(username_store, forKey: "username_store")
        UserDefaults.standard.set(pass_store, forKey: "pass_store")
        UserDefaults.standard.synchronize()
        
        //display alert 
        let myalert = UIAlertController(title:"Alert", message: "Registration is successful, Thank You", preferredStyle : UIAlertControllerStyle.alert)
       
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler: nil)
        
        myalert.addAction(okAction)
        present(myalert, animated: true, completion: nil)

    }
    
    //Email regx validation
    func isValidEmailAddress(emailAddressString: String) -> Bool
    {
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
                if results.count == 0
                {
                    returnValue = false
                }
            
            } catch let error as NSError
                {
                    print("invalid regex: \(error.localizedDescription)")
                    returnValue = false
                }
        return  returnValue
    }
  
    //Password regx validation
    func isValidPassword(passswordString: String) -> Bool
    {
        var returnValue = true
        let passwordRegEx = "^([a-zA-Z0-9@*#]{8,15})$"
        
        do {
            let regex = try NSRegularExpression(pattern: passwordRegEx)
            let nsString = passswordString as NSString
            let results = regex.matches(in: passswordString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError
        {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    
    //display alert
    func displayMyAlertMessage(userMessage : String)
    {
        let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        present(myAlert, animated: true, completion: nil)
    }
    
    //If you have registerd go to login page
    @IBAction func alreadyreg(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
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
