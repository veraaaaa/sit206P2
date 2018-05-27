//
//  Trip.swift
//  TripAdvisor App
//
//  Created by Mohamed Abdelrazek on 16/4/18.
//  Copyright © 2018 Deakin. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit
import CoreData


class Trip : NSObject, MKAnnotation {
    var title : String?
    var subTitle : String?
    var tripDestination : String
    var tripDuration : Int
    var tripDate : String
    var img : UIImage
    var coordinate : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    init(_ destination : String,_ duration : Int, _ date : String, _ image : UIImage )
    {
        tripDestination = destination
        tripDuration = duration
        tripDate = date
        img  = image
        
        super.init()
        updateTripData()
    }
    func updateTripData() {
        title = tripDestination
        subTitle = tripDate
        getLocationFromDestination()
    }
    func getLocationFromDestination() {
        CLGeocoder().geocodeAddressString(tripDestination) {
            (placemarks, error) in
            let placemark = placemarks?.first
            self.coordinate = (placemark?.location?.coordinate)!
        }
    }
}


class Trips {
    static var trips = [Trip]()
   
    static func getTrips() -> [Trip] {
        //if trips.count == 0 { loadTrips() }
        return trips
    }
    
    static func addTrip(destination : String, duration : Int16, date : String, img : UIImage) {
       
    }
   
    static func getTrip(at : Int) -> Trip? {
        if trips.count < 1 { loadTrips() }
        
        if at >= 0 && at < trips.count {
            return trips[at]
        }
        return nil
    }
    static func loadTrips() {
        if trips.count == 0 {
         
         //Add a trip to Melbourne
            trips.append ( Trip("Melbourne", 3 , "2018/10/10", UIImage(named : "Melbourne")!))
        
            trips.append ( Trip("Sydney", 13, "2018/08/10", UIImage(named : "Sydney")!))
    
            trips.append (Trip("Adelaide", 10, "2017/08/10", UIImage(named : "Adelaide")!))
         
        }
        
    }
}
    
    
    


