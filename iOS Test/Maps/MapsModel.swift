//
//  Model.swift
//  iOS Test
//
//  Created by Гарик on 24.02.2023.
//

import Foundation
import MapKit

struct MapsModel {
    let coordinater: CLLocationCoordinate2D
    
    static let points = [
        CLLocationCoordinate2D(latitude: 37.332331, longitude: -122.031219),
        CLLocationCoordinate2D(latitude: 37.330915, longitude: -122.029565),
        CLLocationCoordinate2D(latitude: 37.330515, longitude: -122.032232),
        CLLocationCoordinate2D(latitude: 37.329774, longitude: -122.031392),
        CLLocationCoordinate2D(latitude: 37.329278, longitude: -122.032578)
    ]
}
