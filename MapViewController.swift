

import UIKit
import MapKit
import CoreLocation



class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var tripsMap: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tripsMap.delegate = self
        tripsMap.showsUserLocation = true
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        // Do any additional setup after loading the view.
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annontationId = "viewForAnnoation"
        var annoationView = mapView.dequeueReusableAnnotationView(withIdentifier: annontationId)
        if ((annotation as? Trip) != nil){
            if annoationView == nil {
                annoationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annontationId)
                annoationView?.image = (annotation as! Trip).img
                annoationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                annoationView?.canShowCallout = true
            }
            else {
                annoationView?.annotation = annotation
            }
        }
        return annoationView
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tripDetails")
        (vc as! TripDetailsViewController).trip = view.annotation as? Trip
        self.present(vc!, animated: true, completion: nil)
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

