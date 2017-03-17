//
//  FoodDetailViewController.swift
//  FoodDiary
//
//  Created by BridgeLabz Solutions LLP  on 3/6/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit
import CoreData
import CoreLocation
import MapKit

class FoodDetailViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate{

    
    var getfromview = [NSManagedObject]()
    var food2 = [NSManagedObject]()

    @IBOutlet weak var food: UILabel!

    @IBOutlet weak var rest: UILabel!

    @IBOutlet weak var map: MKMapView!
    
  
    var lat:Double? = 0.0
    var long:Double? = 0.0
    var name:String?
    var rname:String?
  
    var location = CLLocation()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        food2 = getfromview
        
        food.text = name
        rest.text = rname
        
        self.showonmap(latitude: lat!, longitude: long!)
  
    }
    func showonmap(latitude:Double,longitude:Double) {
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myloc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude,longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myloc, span)
        map.setRegion(region, animated: true)
        self.map.showsUserLocation = true
        
    }
}
