
//  ViewController.swift
//  Title : TableView Demo

//  Created by Mohan Badgujar at BridgeLabz Solutions LLP  on 2/27/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.


import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    var players = ["dhoni","harbajan","rohit","bhuvnesvar","sachin","yuvraj","kohli","aswin","shikhar","rayna"]
   
    var index:Int! = 0
   
    
    @IBOutlet weak var team: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
       let str = "Indian Cricket Team"
       let myMutableString = NSMutableAttributedString(
            string: str,
            attributes: [NSFontAttributeName:UIFont(
                name: "Georgia",
                size: 18.0)!])
    
        
        //Apply attribute to the label
        myMutableString.addAttribute(
            NSFontAttributeName,
            value: UIFont(
            name: "Chalkduster",
            size: 24.0)!,
            range: NSRange(
            location: 7,
            length: 7))
        
        
        myMutableString.addAttribute(
            NSForegroundColorAttributeName,
            value: UIColor.blue,
            range: NSRange(
                location:0,
                length:6))
        
        myMutableString.addAttribute(
            NSForegroundColorAttributeName,
            value: UIColor.black,
            range: NSRange(
                location:7,
                length:7))
       
        myMutableString.addAttribute(
            NSForegroundColorAttributeName,
            value: UIColor.red,
            range: NSRange(
                location:15,
                length:4))
        team.attributedText = myMutableString
       
          title  = str
    }

    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.players.count
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:playerCell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! playerCell
        
        cell.playerImage.image = UIImage(named:self.players[indexPath.row])
        
        cell.playerName.text = self.players[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        index = indexPath.row
    
        let vc:SecondView = storyboard?.instantiateViewController(withIdentifier: "SecondView") as! SecondView
        vc.pimage = UIImage(named:self.players[indexPath.row])
        vc.pname = players[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func buttonisPressed(_ sender: Any)
    {
        let vc:SecondView = storyboard?.instantiateViewController(withIdentifier: "SecondView") as! SecondView
        vc.pimage = UIImage(named:self.players[index])
        vc.pname = players[index]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
