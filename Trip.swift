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
    var tripDate : String
    var tripDuration : Int
    var tripDescription : String
    var img : UIImage
    var coordinate : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    init(_ destination : String, _ description: String, _ date : String, _ image : UIImage, _ duration : Int)
    {
        tripDestination = destination
        tripDate = date
        tripDuration = duration
        img  = image
        tripDescription = description
        
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
        if trips.count == 0 { loadTrips() }
        return trips
    }
    
    static func addTrip(destination : String, duration : Int16, description : String, date : String, img : UIImage, image: UIImage) {
       
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
            trips.append ( Trip("Greek","beautiful sea side view", "2018/10/10", UIImage(named : "Greek")!,3))
        
            trips.append ( Trip("China", "Long history country", "2018/08/10", UIImage(named : "China")!,5))
    
            trips.append (Trip("Canada","beautiful camping in the natural site", "2017/08/10", UIImage(named : "Canada")!,10))
         
        }
        
    }
    
    
    
}

