//
//  SimpleMapViewController.swift
//  FlightMap-Demo-iOS
//
//  Created by Intern on 23/06/20.
//  Copyright © 2020 Intern. All rights reserved.
//

import UIKit
import Mapbox

class SimpleMapViewController: UIViewController {

    // MARK: Properties
    private var mapView: MGLMapView?

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
        mapView = MGLMapView(frame: self.view.bounds, styleURL: FLIGHTMAP.lightTheme)

        /// Set camera at a specific lat long along with zoom and animation
        let center = CLLocationCoordinate2D(latitude: 30.6, longitude: 76.8)

        // Optionally set a starting point.
        mapView?.setCenter(center, zoomLevel: 7, direction: 0, animated: false)
        mapView?.delegate = self
        self.view.addSubview(mapView!)
    }

}

extension SimpleMapViewController: MGLMapViewDelegate {

    /// Callback for when the mapview has finished loading tiles
    func mapViewDidFinishLoadingMap(_ mapView: MGLMapView) {
    // Wait for the map to load before initiating the first camera movement.

    // Create a camera that rotates around the same center point, rotating 180°.
    // `fromDistance:` is meters above mean sea level that an eye would have to be in order to see what the map view is showing.
    let camera = MGLMapCamera(lookingAtCenter: mapView.centerCoordinate, altitude: 4500, pitch: 15, heading: 180)

    // Animate the camera movement over 5 seconds.
    mapView.setCamera(camera, withDuration: 1, animationTimingFunction: CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut))
    }
}
