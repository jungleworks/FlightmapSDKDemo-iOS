//
//  Constants.swift
//  FlightMap-Demo-iOS
//
//  Created by Intern on 22/06/20.
//  Copyright © 2020 Intern. All rights reserved.
//

import Foundation
import UIKit
struct TEXT {
    /// LoginViewController
    static let placeholder_login = "Flightmap access token here"
    static let getAccessToken_login = "Don't have an access token ?"

    /// HomeViewController
    static let simpleMapTitle = "Simple Map"
    static let simpleMapSubtitle = "Shows a simple map"

    static let bulkMarkerTitle = "Add Markers In Bulk"
    static let bulkMarkerSubtitle = "Add Markers In Bulk to a Map"

    static let dynamicMarkerTitle = "Dynamic Marker"
    static let dynamicMarkerSubtitle = "Update position and icon"

    static let polygonTitle = "Polygon"
    static let polygonSubtitle = "Add a polygon to a map"

    static let polylineTitle = "Polyline"
    static let polylineSubtitle =  "Add a polyline to a map"

    static let tapMarkerTitle = "Press Map For Marker"
    static let tapMarkerSubtitle = "Add marker to map on long press"

    static let animationTypesTitle = "Animation Types"
    static let animationTypesSubtitle = "Showcase the different animation types"

    static let cameraPositionTitle = "Camera Position Method"
    static let cameraPostionSubtitle = "Camera position capabilities"

    static let standardIWTitle = "Standard Info Window"
    static let standardIWSubtitle = "Learn how to handle the info window"

    static let customIWTitle = "Custom Info Window"
    static let customIWSubtitle = "Learn how to create a custom info window"

    static let reset = "RESET"
}

struct IDENTIFIER {
    static let homeViewController = "HomeViewController"
    static let simpleMapController = "SimpleMapViewController"
    static let tapMarkerController = "TapMarkerViewController"
    static let infoWindowController = "InfoWindowViewController"
    static let polylineController = "PolylineViewController"
    static let polygonController = "PolygonViewController"
    static let geoJsonController = "GeoJsonViewController"
    static let dynamicMarkerController = "DynamicMarkerViewController"
    static let cameraAnimationController = "CameraAnimationViewController"
    static let customInfoController = "CustomInfoViewController"
}

struct STORYBOARD {
    static let main = "Main"
}

struct NIB {
    static let homeCell = "HomeTableViewCell"
}

struct COLOR {
    static let themeColor = UIColor(red: 33/255, green: 139/255, blue: 179/255, alpha: 1)
}

struct FLIGHTMAP {
    static let dummyToken = "2e769c60-174c-11ea-acdf-896965e04014"
    static let lightTheme = URL(string: "https://maps.flightmap.io/styles//style-bright.json")
    static let darkTheme = URL(string: "https://maps.flightmap.io/styles//style-dark.json")
}
