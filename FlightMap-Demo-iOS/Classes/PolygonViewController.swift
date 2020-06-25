//
//  PolygonViewController.swift
//  FlightMap-Demo-iOS
//
//  Created by Intern on 24/06/20.
//  Copyright © 2020 Intern. All rights reserved.
//

import UIKit
import Mapbox

class PolygonViewController: UIViewController {

    // MARK: Properties
    var mapView: MGLMapView!
    let coordinates = [
      (-72.2845888, 42.930725),
      (-72.2914124, 42.9264829),
      (-72.2877216, 42.9202607),
      (-72.2735167, 42.9197892),
      (-72.269268, 42.9269857),
      (-72.2721004, 42.9320132),
      (-72.2754908, 42.9358465),
      (-72.2918415, 42.9357522),
      (-72.2844601, 42.9307564),
      (-72.2845888, 42.930725)
    ].map({CLLocationCoordinate2D(latitude: $0.1, longitude: $0.0)})

   override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupMapView()
    }

    private func setupViews() {
        /// setup navigation views
    }

    private func setupMapView() {
        /// Initialize mapview with along with frame and style URL
        MGLAccountManager.accessToken = FLIGHTMAP.dummyToken
        mapView = MGLMapView(frame: self.view.bounds, styleURL: FLIGHTMAP.lightTheme)

        /// Set camera at a specific lat long along with zoom and animation
        let center = CLLocationCoordinate2D(latitude: 30.6, longitude: 76.8)

        // Optionally set a starting point.
        mapView?.setCenter(center, zoomLevel: 7, direction: 0, animated: false)
        mapView?.delegate = self
        self.view.addSubview(mapView!)
    }

}

extension PolygonViewController: MGLMapViewDelegate {
    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
        let polygon = MGLPolygon(coordinates: self.coordinates, count: UInt(self.coordinates.count))
        mapView.addAnnotation(polygon)
        mapView.setVisibleCoordinates(self.coordinates, count: UInt(self.coordinates.count), edgePadding: UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0), animated: true)
    }

    /// Change fill color for polygon annotation (opacity)
    func mapView(_ mapView: MGLMapView, fillColorForPolygonAnnotation annotation: MGLPolygon) -> UIColor {
        return UIColor(red: 50/255, green: 205/255, blue: 50/255, alpha: 0.5)
    }
}
