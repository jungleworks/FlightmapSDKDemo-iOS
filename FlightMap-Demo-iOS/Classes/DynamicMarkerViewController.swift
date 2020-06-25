//
//  DynamicMarkerViewController.swift
//  FlightMap-Demo-iOS
//
//  Created by Intern on 24/06/20.
//  Copyright © 2020 Intern. All rights reserved.
//

import UIKit
import Mapbox

class DynamicMarkerViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var changePositionButton: UIButton!

    // MARK: Properties
    let coordinates = [
        (-72.2853184, 42.9343069),
        (-72.2894382, 42.925383),
        (-72.271843, 42.9258858)
        ].map({CLLocationCoordinate2D(latitude: $0.1, longitude: $0.0)})
    var currentIndex = 0
    var annotation = MGLPointAnnotation()

    private var flightMapView: MGLMapView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupMapView()
    }

    override func viewWillLayoutSubviews() {
        self.flightMapView?.frame = mapView.bounds
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
        flightMapView?.setCenter(center, zoomLevel: 7, direction: 0, animated: false)
        flightMapView?.delegate = self
        self.mapView.addSubview(flightMapView!)
    }

    // MARK: Actions
    @IBAction func changePositionAction(_ sender: Any) {
        if currentIndex+1 < coordinates.count {
            currentIndex += 1
            annotation.coordinate = coordinates[currentIndex]

        } else {
            currentIndex = 0
            annotation.coordinate = coordinates[currentIndex]
        }

    }
}

extension DynamicMarkerViewController: MGLMapViewDelegate {

    /// Method to change default marker image
    func mapView(_ mapView: MGLMapView, imageFor annotation: MGLAnnotation) -> MGLAnnotationImage? {

        /// Unique identifier for each annotation
        let id = "\(annotation.coordinate.latitude)+\(annotation.coordinate.longitude)"
        var annotationImage = mapView.dequeueReusableAnnotationImage(withIdentifier: id)
        if annotationImage == nil {
            var image: UIImage?
            image = UIImage(named: "demoMarkerImage")
            guard var imageWrap = image else { return nil }
            imageWrap = imageWrap.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: imageWrap.size.height/2, right: 0))
            annotationImage = MGLAnnotationImage(image: imageWrap, reuseIdentifier: id)
        }
        return annotationImage
    }

    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
        mapView.setVisibleCoordinates(self.coordinates, count: UInt(self.coordinates.count), edgePadding: UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0), animated: true)
        annotation.coordinate = coordinates[currentIndex]
        mapView.addAnnotation(annotation)
    }
}
