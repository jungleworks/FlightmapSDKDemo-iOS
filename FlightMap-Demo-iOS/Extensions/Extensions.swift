//
//  Extensions.swift
//  FlightMap-Demo-iOS
//
//  Created by Intern on 23/06/20.
//  Copyright © 2020 Intern. All rights reserved.
//

import Foundation
import UIKit
import Mapbox

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

extension MGLMapView {
    func clear() {
        if let annotations = self.annotations {
            if annotations.count > 0 {
                for annotation in annotations {
                    self.removeAnnotation(annotation)
                }
            }
        }
    }

    func changeMarkerIcon(image: UIImage?, annotation: MGLAnnotation) {
        let id = "\(annotation.coordinate.latitude)+\(annotation.coordinate.longitude)"
        let annotationImage = self.dequeueReusableAnnotationImage(withIdentifier: id)
        annotationImage?.image = image
    }
}
