//
//  NavigationBar.swift
//  FlightMap-Demo-iOS
//
//  Created by Intern on 22/06/20.
//  Copyright © 2020 Intern. All rights reserved.
//

import Foundation
import UIKit

class NavigationBar: UIView {

    // MARK: Outlets
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var leftBarButton: UIButton!
    @IBOutlet weak var navigationTitle: UILabel!
    @IBOutlet weak var rightBarButton: UIButton!

    // MARK: Properties
    static let NIB_NAME = "NavigationBar"
    var title: String = "" {
        didSet {
            self.navigationTitle.text = title
        }
    }

    override func awakeFromNib() {

    }

}
