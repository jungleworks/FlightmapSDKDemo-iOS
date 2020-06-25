//
//  TapMarkerViewController.swift
//  FlightMap-Demo-iOS
//
//  Created by Intern on 23/06/20.
//  Copyright © 2020 Intern. All rights reserved.
//

import UIKit
import Mapbox

class TapMarkerViewController: UIViewController {

    // MARK: Properties
    private var mapView: MGLMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupMapView()
    }

    private func setupViews() {
        /// setup navigation views
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: TEXT.reset, style: .plain, target: self, action: #selector(resetAction))
    }

    @objc private func resetAction() {
        mapView.clear()
    }

    private func setupMapView() {
        /// Initialize mapview with along with frame and style URL
        MGLAccountManager.accessToken = FLIGHTMAP.dummyToken
        mapView = MGLMapView(frame: self.view.bounds, styleURL: FLIGHTMAP.lightTheme)

        /// Set camera at a specific lat long along with zoom and animation
        let center = CLLocationCoordinate2D(latitude: 28.644800, longitude: 77.216721)

        /// Optionally set a starting point.
        mapView?.setCenter(center, zoomLevel: 13.0, direction: 0, animated: false)
        self.view.addSubview(mapView!)

        let singleTap = UITapGestureRecognizer(target: self, action: #selector(handleMapTap(sender:)))
        for recognizer in mapView.gestureRecognizers! where recognizer is UITapGestureRecognizer {
        singleTap.require(toFail: recognizer)
        }
        mapView.addGestureRecognizer(singleTap)
    }

    @objc func handleMapTap(sender: UITapGestureRecognizer) {
        let tapPoint: CGPoint = sender.location(in: mapView)
        let tapCoordinate: CLLocationCoordinate2D = mapView.convert(tapPoint, toCoordinateFrom: nil)
        print("You tapped at: \(tapCoordinate.latitude), \(tapCoordinate.longitude)")
        let annotation = MGLPointAnnotation()
        annotation.coordinate = tapCoordinate
        mapView.addAnnotation(annotation)
    }

}
