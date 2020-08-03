//
//  MapViewController.swift
//  Media Finder
//
//  Created by user on 01.06.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import UIKit
import MapKit

protocol MapDelegate  {
    func setDelailLocationInAddress(Address: String)
}



class MapVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    
    
    var delegate: MapDelegate?
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 1000
    var previousLocation: CLLocation?
    lazy var geocoder = CLGeocoder()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    
    
    
    
    
    
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        
        if sender.state == .ended {
            let locationInView = sender.location(in: mapView)
            let tappedCoordinate = mapView.convert(locationInView, toCoordinateFrom: mapView)
            addAnnotation(coordinate: tappedCoordinate)
            
            
            
            
        }
    }
    
    @IBAction func submitBtnPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}


extension MapVC {
    private func addAnnotation(coordinate: CLLocationCoordinate2D){
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        getNameOfLocation(lat: coordinate.latitude, long: coordinate.longitude)
        
    }
    
    private func getNameOfLocation(lat: CLLocationDegrees, long: CLLocationDegrees) {
        
        
        let location = CLLocation(latitude: lat, longitude: long)
        
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            self.processResponse(withPlacemarks: placemarks, error: error)
            
            
        }
        
    }
    
    private func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
        
        if error != nil {
            addressLabel.text = "Unable to Find Adress For Location"
        } else {
            if let placemarks = placemarks, let placemark = placemarks.first {
                addressLabel.text = placemark.compactAddress ?? ""
                delegate?.setDelailLocationInAddress(Address: placemark.compactAddress ?? "")
            } else {
                addressLabel.text = "No Matching Address Found"
                delegate?.setDelailLocationInAddress(Address: "No Matching Addresses Found")
            }
        }
    }
}

extension CLPlacemark {
    var compactAddress: String? {
        if let name = name {
            var result = name
            
            if let street = thoroughfare {
                result += ", \(street)"
            }
            
            if let city = locality {
                result += ", \(city)"
            }
            
            if let country = country {
                result += ", \(country)"
            }
            
            return result
        }
        
        return nil
    }
}

