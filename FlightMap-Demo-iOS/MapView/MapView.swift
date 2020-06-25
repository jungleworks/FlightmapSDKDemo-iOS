//
//  MapView.swift
//  FlightMap-Demo-iOS
//
//  Created by Intern on 23/06/20.
//  Copyright © 2020 Intern. All rights reserved.
//

import Foundation
import UIKit
import Mapbox

class MapView: UIView {

    // MARK: Properties
    var mapView: MGLMapView?

    override func awakeFromNib() {
        MGLAccountManager.accessToken = FLIGHTMAP.dummyToken
        mapView = MGLMapView(frame: self.bounds, styleURL: FLIGHTMAP.lightTheme)
        self.addSubview(mapView!)
    }

}
