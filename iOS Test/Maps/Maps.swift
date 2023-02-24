//
//  Maps.swift
//  iOS Test
//
//  Created by Гарик on 19.02.2023.
//

import UIKit
import MapKit

class MapsController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        addAnnotation()
    }
    
    func addAnnotation() {
        let locations = MapsModel.points
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            mapView.addAnnotation(annotation)
        }
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
}

extension MapsController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let view = MKAnnotationView()
        view.image = UIImage(named: "point")
        return view
    }
}
