//
//  CameraAnimationViewController.swift
//  FlightMap-Demo-iOS
//
//  Created by Intern on 24/06/20.
//  Copyright © 2020 Intern. All rights reserved.
//

import UIKit
import Mapbox

class CameraAnimationViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var animateButton: UIButton!
    @IBOutlet weak var zoomInButton: UIButton!
    @IBOutlet weak var zoomOutButton: UIButton!

    // MARK: Properties
    var flightMapView: MGLMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupMapView()
    }

    override func viewWillLayoutSubviews() {
        self.flightMapView.frame = mapView.bounds
    }

    private func setupViews() {
        /// setup navigation views
    }

    private func setupMapView() {
        /// Initialize mapview with along with frame and style URL
        MGLAccountManager.accessToken = FLIGHTMAP.dummyToken
        flightMapView = MGLMapView(frame: self.mapView.bounds, styleURL: FLIGHTMAP.lightTheme)

        /// Set camera at a specific lat long along with zoom and animation
        let center = CLLocationCoordinate2D(latitude: 30.6, longitude: 76.8)

        // Optionally set a starting point.
        flightMapView.setCenter(center, zoomLevel: 7, direction: 0, animated: false)
        flightMapView.delegate = self
        self.mapView.addSubview(flightMapView)
    }

    // MARK: Actions
    @IBAction func zoomInAction(_ sender: Any) {
        flightMapView.setZoomLevel(flightMapView.zoomLevel+1, animated: true)
    }

    @IBAction func zoomOutAction(_ sender: Any) {
         flightMapView.setZoomLevel(flightMapView.zoomLevel-1, animated: true)
    }

    @IBAction func animateAction(_ sender: Any) {
        let camera = MGLMapCamera(lookingAtCenter: flightMapView.centerCoordinate, altitude: 4500, pitch: 15, heading: 180)
        flightMapView.setCamera(camera, withDuration: 2, animationTimingFunction: CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut))
    }
}

extension CameraAnimationViewController: MGLMapViewDelegate {
    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {

    }
}
