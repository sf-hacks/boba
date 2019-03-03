//
//  ViewController.swift
//  boba
//
//  Created by Christopher Rosana on 3/2/19.
//  Copyright © 2019 sfhacks. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var findLocationButton: UIButton!
    
    let locationManager = CLLocationManager()
    var location: CLLocation?
    var isUpdatingLocation = false
    var lastLocationError: Error?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func findLocation() {
        // get user permission to use location services
        let authorizationStatus = CLLocationManager.authorizationStatus()
        
        if authorizationStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        // report if permission is denied
        if authorizationStatus == .restricted || authorizationStatus == .denied {
            reportLocationServicesDeniedError()
            return
        }
        
        // start or stop updating location
        if isUpdatingLocation {
            stopLocationManager()
        } else {
            location = nil
            lastLocationError = nil
            startLocationManager()
        }
    }
    
    func update() {
        let latitude = location!.coordinate.latitude
        let longtitude = location!.coordinate.longitude
        
        print("latitude: \(latitude)")
        print("longtitude: \(longtitude)")
    }
    
    func startLocationManager() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            isUpdatingLocation = true
            //self.performSegue(withIdentifier: "locationToHome", sender: self)

        }
    }
    
    func stopLocationManager() {
        if isUpdatingLocation {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            isUpdatingLocation = false
        }
    }
    
    func reportLocationServicesDeniedError() {
        let alert =  UIAlertController(title: "Oops! Location services is disabled.", message: "Please go to Settings > Privacy to enable location services to use this app", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error!! locationManager-didFailWithError:\(error)")
        if (error as NSError).code == CLError.locationUnknown.rawValue {
            return
        }
        
        lastLocationError = error
        stopLocationManager()
        
        update()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last!
        print("GOT IT locationManager-didUpdateLocations: \(location)" )
        stopLocationManager()
        update()
    }
    
//    override func performSegue(withIdentifier identifier: String, sender: Any?) {
//        self.performSegue(withIdentifier: "locationToHome", sender: self)
//
//    }
    
}

