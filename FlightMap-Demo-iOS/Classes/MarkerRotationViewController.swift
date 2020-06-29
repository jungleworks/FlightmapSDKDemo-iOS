//
//  MarkerRotationViewController.swift
//  FlightMap-Demo-iOS
//
//  Created by Intern on 25/06/20.
//  Copyright © 2020 Intern. All rights reserved.
//

import UIKit
import Mapbox

class MarkerRotationViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var markerRotationButton: UIButton!

    // MARK: Properties
    private var mapView: MGLMapView?
    var annotation: MGLPointAnnotation!
    var rotation = Bool() {
        didSet {
            if rotation {
                rotationCounter = 1
            } else {
                rotationCounter = 2
            }
        }
    }
    var rotationCounter: CGFloat = 1

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
        self.view.bringSubviewToFront(markerRotationButton)
    }
    
    @IBAction func rotateMarker(_ sender: Any) {
        rotation.toggle()
        mapView?.rotateWithAnimation(annotation: self.annotation, bearing: CGFloat(.pi/rotationCounter))
    }




}

extension MarkerRotationViewController: MGLMapViewDelegate {

    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
        annotation = MGLPointAnnotation()
        annotation.coordinate = mapView.centerCoordinate
        mapView.addAnnotation(annotation)
    }

    /// Provide a custom view for annotations
    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        guard annotation is MGLPointAnnotation else {
            return nil
        }

        // Use the point annotation’s longitude value (as a string) as the reuse identifier for its view.
        let reuseIdentifier = "\(annotation.coordinate.longitude)"
        print(reuseIdentifier, "-------------")

        // For better performance, always try to reuse existing annotations.
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) as? CustomViewForAnnotation
        if annotationView == nil {
            annotationView = CustomViewForAnnotation(reuseIdentifier: reuseIdentifier)
            annotationView!.bounds = CGRect(x: 0, y: 0, width: 40, height: 40)
            annotationView?.loadPinView()
        } else {
            print("Reuse Identifier ------------------------------------------")
        }
        return annotationView
    }
}

extension MGLMapView {

    /// Method to rotate custom annotation view
    func rotateWithAnimation(annotation: MGLAnnotation, bearing: CGFloat = 0, duration: Double = 3.0) {
        if let view = self.view(for: annotation) as? CustomViewForAnnotation {
            UIView.animate(withDuration: duration) {
                view.pinImageView.transform = CGAffineTransform(rotationAngle: bearing)
            }
        }
    }
}

class CustomViewForAnnotation: MGLAnnotationView {

    var pinImageView = UIImageView()
    var image = UIImage(named: "demoMarkerImage")
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderWidth = 0.0

    }

    func loadPinView() {
        pinImageView = UIImageView(image: image)
        addSubview(pinImageView)

    }



}
