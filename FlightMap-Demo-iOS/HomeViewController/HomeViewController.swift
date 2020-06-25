//
//  HomeViewController.swift
//  FlightMap-Demo-iOS
//
//  Created by Intern on 22/06/20.
//  Copyright © 2020 Intern. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: Properties
    var presenter: HomeViewPresenter!


    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTableView()
        setupPresenter()
    }

    // MARK: Methods

    private func setupPresenter() {
        self.presenter = HomeViewPresenter(self)
    }

    private func setupViews() {
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationController?.navigationBar.barTintColor = COLOR.themeColor
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.isNavigationBarHidden = false
        self.title = "Flightmap Demo"
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none

        /// Register cell
        tableView.register(UINib(nibName: NIB.homeCell, bundle: nil), forCellReuseIdentifier: NIB.homeCell)
    }

    private func pushTo(id: String) {
        let storyboard = UIStoryboard(name: STORYBOARD.main, bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: id)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: TableView Delegate and DataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view: HomeSectionHeader = .fromNib()
        view.titleLabel.text = presenter.getSectionTitle(for: section)
        return view
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.getSectionCount()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getRowCount(for: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NIB.homeCell) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        let cellModel = presenter.viewModel(for: indexPath)
        cell.setupCellModel(with: cellModel)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionType = presenter.sections[indexPath.section]
        if let rowData = presenter.sectionData[sectionType] {
            switch rowData[indexPath.row] {
            /// Basic
            case .simpleMap:
                self.pushTo(id: IDENTIFIER.simpleMapController)

            /// Annotation
            case .bulkMarker:
                self.pushTo(id: IDENTIFIER.geoJsonController)
            case .dynamicMarker:
                self.pushTo(id: IDENTIFIER.dynamicMarkerController)
            case .polygon:
                self.pushTo(id: IDENTIFIER.polygonController)
            case .polyline:
                self.pushTo(id: IDENTIFIER.polylineController)
            case .tapForMarker:
                self.pushTo(id: IDENTIFIER.tapMarkerController)

            /// Camera
            case .cameraPostion:
                break
            case .animationTypes:
                self.pushTo(id: IDENTIFIER.cameraAnimationController)

            /// Info Window
            case .standardInfoWindow:
                self.pushTo(id: IDENTIFIER.infoWindowController)
            case .customInfoWindow:
                self.pushTo(id: IDENTIFIER.customInfoController)
            }
        }

    }
}

extension HomeViewController: HomeViewDelegate {
    
}
