
//  ViewController.swift
//  Title :- TableViewDemo1

//  Created by BridgeLabz Solutions LLP  on 3/10/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var simpleTableView: UITableView!
    
    var animals = ["Dog","Elephant","Lion","Zebra","Cat"]
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "mycell")
        cell.textLabel?.text = animals[indexPath.row]
        let image : UIImage = UIImage(named: animals[indexPath.row])!
        cell.imageView?.image = image
        return cell
    }
}
   



