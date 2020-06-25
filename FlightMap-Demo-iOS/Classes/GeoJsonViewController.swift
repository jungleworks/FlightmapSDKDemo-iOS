//
//  GeoJsonViewController.swift
//  FlightMap-Demo-iOS
//
//  Created by Intern on 24/06/20.
//  Copyright © 2020 Intern. All rights reserved.
//
import UIKit
import Mapbox

class GeoJsonViewController: UIViewController, MGLMapViewDelegate {

    var mapView: MGLMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView = MGLMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.styleURL = FLIGHTMAP.lightTheme

       mapView.setCenter(CLLocationCoordinate2D(latitude: 38.897435, longitude: -77.039679), zoomLevel: 12, animated: false)
        view.addSubview(mapView)

        mapView.delegate = self
    }

    // Wait until the map is loaded before adding to the map.
    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
        loadGeoJson()
    }

    func loadGeoJson() {
        DispatchQueue.global().async {
            // Get the path for example.geojson in the app’s bundle.
            guard let jsonUrl = Bundle.main.url(forResource: "dc-metro", withExtension: "geojson") else {
                preconditionFailure("Failed to load local GeoJSON file")
            }

            guard let jsonData = try? Data(contentsOf: jsonUrl) else {
                preconditionFailure("Failed to parse GeoJSON file")
            }

            DispatchQueue.main.async {
                //                self.drawPolyline(geoJson: jsonData)
                self.addPoints(geoJson: jsonData)
            }
        }
    }

    func addPoints(geoJson: Data) {
        guard let style = self.mapView.style else { return }
        guard let shapeFromGeoJSON = try? MGLShape(data: geoJson, encoding: String.Encoding.utf8.rawValue) else {
            fatalError("Could not generate MGLShape")
        }

        let source = MGLShapeSource(identifier: "polyline", shape: shapeFromGeoJSON, options: nil)
        style.addSource(source)
        // Configure a circle style layer to represent rail stations, filtering out all data from
        // the source that is not of `metro-station` type.
        let circleLayer = MGLCircleStyleLayer(identifier: "stations", source: source)
        circleLayer.predicate = NSPredicate(format: "TYPE = 'metro-station'")
        circleLayer.circleColor = NSExpression(forConstantValue: UIColor.red)
        circleLayer.circleRadius = NSExpression(forConstantValue: 6)
        circleLayer.circleStrokeWidth = NSExpression(forConstantValue: 2)
        circleLayer.circleStrokeColor = NSExpression(forConstantValue: UIColor.black)

        style.addLayer(circleLayer)
    }

}

