//
//  TripsMapViewController.swift
//  SIT206_Assignment2
//
//  Created by 王雨薇 on 2018/5/24.
//  Copyright © 2018年 wangyuwei. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class TripsMapViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var tripsMap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
