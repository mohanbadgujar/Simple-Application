
//  ViewController.swift
//  FoodDiary

//  Created by Mohan Badgujar at BridgeLabz Solutions LLP  on 3/6/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.


import UIKit
import CoreData
import CoreLocation


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, CLLocationManagerDelegate{

    @IBOutlet weak var tableView: UITableView!

    //Declaration
    var backimage:UIImageView?
    let manager = CLLocationManager()
    var location:CLLocation?
    var food = [NSManagedObject]()
    var lat:Double? = 0.0
    var long:Double? = 0.0
    
    //main method when app open
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        manager.startUpdatingLocation()
        
    //create button
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(ViewController.getData))
        
    title = "Food Journal App"
        
    //MARK:set tableview backgroud
    let tempImageView = UIImageView(image: UIImage(named: "frontpage"))
    tempImageView.frame = self.tableView.frame
    self.tableView.backgroundView = tempImageView

    }
    
    
    //MARK:when location updated
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations[0]
        lat = location?.coordinate.latitude
        long = location?.coordinate.longitude
        print("\(lat)")
        print("\(long)")
    }
    

    //MARK:open view to get data from user
    func getData()
    {
        let alert = UIAlertController(title: "Food Details", message: nil, preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: {(field1:UITextField) -> Void in
            field1.placeholder = "Foodname"
            field1.layer.borderColor = UIColor.blue.cgColor
            field1.layer.cornerRadius = 10
            field1.textColor = UIColor.brown
            
    })

        
        alert.addTextField(configurationHandler: {(field2:UITextField) -> Void in
            field2.placeholder = "Restaurent"
            field2.layer.borderColor = UIColor.green.cgColor
            field2.layer.cornerRadius = 10
            field2.textColor = UIColor.orange
        })
        
        //save data
        
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: {(action:UIAlertAction) -> Void in
        
            let field1 = alert.textFields?.first
            let field2 = alert.textFields?.last
        
          //  if ((field1?.text = "") != nil || (field2?.text = "") != nil){
               if field1?.text != "" || field2?.text != ""
                {
            self.saveItem(tempname: field1?.text!, temprname: field2?.text!)
            
            print("In save action")
            print("Name:",field1!.text!)
            print("RestName:",field2!.text!)
            }else
            {
            print("fill data in text field")
            }
            self.tableView.reloadData()
            
        })
        
        //action for cancel button
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: {(action:UIAlertAction) -> Void in
            
        })
        
    
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK:action for save button
    func saveItem(tempname:String?,temprname:String?)
    {
        print(tempname!)
        print(temprname!)
        
        let delegate = (UIApplication.shared.delegate as? AppDelegate)
        let Context = delegate?.persistentContainer.viewContext
        //2
        let entity =  NSEntityDescription.entity(forEntityName: "FoodData",
                                                 in:Context!)
        
        let fd = NSManagedObject(entity: entity!,insertInto:Context)
        
        //3
        fd.setValue(tempname, forKey: "fname")
        fd.setValue(temprname, forKey: "rname")
        fd.setValue(lat, forKey: "latitude")
        fd.setValue(long, forKey: "longitude")
        
     
        //4
        do
        {
            try Context?.save()
        //5
            food.append(fd)
        }
        catch let error as NSError
        {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
   
    //MARK:number of row in table view
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete
        {
            food.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            
        }
    }
    
    //MARK:load data from core to table cell
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell") as? newCell
        cell?.layer.cornerRadius = 15
        cell?.contentView.layer.borderColor = UIColor.black.cgColor
        let item = food[indexPath.row]
        
        
        cell?.foodname.text = item.value(forKey: "fname") as? String
        
        cell?.restaurantname.text = item.value(forKey: "rname") as? String
        
        return cell!
    }
    
    
    //MARK:View will appaer when load
    override func viewWillAppear(_ animated: Bool)
    {
        //1
        let delegate = (UIApplication.shared.delegate as! AppDelegate)
        
        let Context = delegate.persistentContainer.viewContext
        
        //2
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FoodData")
        
        //3
        do
        {
            let results = try Context.fetch(fetchRequest)
            
        //4
            food = results as! [NSManagedObject]
        } catch let error as NSError
        {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
    }
    

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = food[indexPath.row]
        let vc:FoodDetailViewController? = self.storyboard?.instantiateViewController(withIdentifier: "FoodDetailViewController") as? FoodDetailViewController
        
        print(item.value(forKey: "fname") as! String)
        vc?.name = item.value(forKey: "fname") as? String
        vc?.rname = item.value(forKey: "rname") as? String
        vc?.lat = item.value(forKey: "latitude") as? Double
        vc?.long = item.value(forKey: "longitude") as? Double
        vc?.getfromview = food
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
}




