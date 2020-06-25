//
//  InfoWindowViewController.swift
//  FlightMap-Demo-iOS
//
//  Created by Intern on 24/06/20.
//  Copyright © 2020 Intern. All rights reserved.
//

import UIKit
import Mapbox

class InfoWindowViewController: UIViewController {

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
        MGLAccountManager.accessToken = FLIGHTMAP.dummyToken
        mapView = MGLMapView(frame: self.view.bounds, styleURL: FLIGHTMAP.lightTheme)

        /// Set camera at a specific lat long along with zoom and animation
        let center = CLLocationCoordinate2D(latitude: 30.6, longitude: 76.8)

        // Optionally set a starting point.
        mapView?.setCenter(center, zoomLevel: 10, direction: 0, animated: false)
        mapView?.delegate = self
        self.view.addSubview(mapView!)
    }

}

extension InfoWindowViewController: MGLMapViewDelegate {
    func mapViewDidFinishLoadingMap(_ mapView: MGLMapView) {
        let annotation = MGLPointAnnotation()
        annotation.coordinate = mapView.centerCoordinate
        annotation.title = "Default Title"
        annotation.subtitle = "Default Subtitle"
        mapView.addAnnotation(annotation)
    }

    /// To enable annotation to show callout views, this function must return true
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }

    func mapView(_ mapView: MGLMapView, leftCalloutAccessoryViewFor annotation: MGLAnnotation) -> UIView? {
        if (annotation.title! == "Default Title") {
            /// Callout height is fixed; width expands to fit its content.
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 50))
            label.textAlignment = .right
            label.textColor = UIColor(red: 0.81, green: 0.71, blue: 0.23, alpha: 1)
            label.text = "默认"

            return label
        }

        return nil
    }

    func mapView(_ mapView: MGLMapView, rightCalloutAccessoryViewFor annotation: MGLAnnotation) -> UIView? {
        let button = UIButton(type: .infoDark)
        button.tintColor = .black
        return button
    }

    func mapView(_ mapView: MGLMapView, annotation: MGLAnnotation, calloutAccessoryControlTapped control: UIControl) {
    /// Hide the callout view.
    mapView.deselectAnnotation(annotation, animated: false)

    /// Show an alert containing the annotation's details
    let alert = UIAlertController(title: annotation.title!!, message: "This is the default callout view.", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    self.present(alert, animated: true, completion: nil)

    }
}
