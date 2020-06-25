//
//  HomeViewPresenter.swift
//  FlightMap-Demo-iOS
//
//  Created by Intern on 23/06/20.
//  Copyright © 2020 Intern. All rights reserved.
//

import Foundation
protocol HomeViewDelegate: class {

}

enum RowData {

    /// Basic
    case simpleMap

    /// Annotation
    case bulkMarker
    case dynamicMarker
    case polygon
    case polyline
    case tapForMarker

    /// Camera
    case animationTypes
    case cameraPostion

    /// Info Window
    case standardInfoWindow
    case customInfoWindow

    func getTitle() -> String {
        switch self {
            case .simpleMap:
                return TEXT.simpleMapTitle
            case .bulkMarker:
                return TEXT.bulkMarkerTitle
            case .dynamicMarker:
                return TEXT.dynamicMarkerTitle
            case .polygon:
                return TEXT.polygonTitle
            case .polyline:
                return TEXT.polylineTitle
            case .tapForMarker:
                return TEXT.tapMarkerTitle
            case .animationTypes:
                return TEXT.animationTypesTitle
            case .cameraPostion:
                return TEXT.cameraPositionTitle
            case .standardInfoWindow:
                return TEXT.standardIWTitle
            case .customInfoWindow:
                return TEXT.customIWTitle
        }
    }

    func getSubtitle() -> String {
        switch self {
            case .simpleMap:
                return TEXT.simpleMapSubtitle
            case .bulkMarker:
                return TEXT.bulkMarkerSubtitle
            case .dynamicMarker:
                return TEXT.dynamicMarkerSubtitle
            case .polygon:
                return TEXT.polygonSubtitle
            case .polyline:
                return TEXT.polygonSubtitle
            case .tapForMarker:
                return TEXT.tapMarkerSubtitle
            case .animationTypes:
                return TEXT.animationTypesSubtitle
            case .cameraPostion:
                return TEXT.cameraPostionSubtitle
            case .standardInfoWindow:
                return TEXT.standardIWSubtitle
            case .customInfoWindow:
                return TEXT.customIWSubtitle
        }
    }
}

enum SectionType: String {
    case basic = "Basic"
    case annotation = "Annotations"
    case camera = "Camera"
    case infoWindow = "Info Window"
}

class HomeViewPresenter: HomeViewDelegate {

    // MARK: Properties
    private weak var homeView: HomeViewDelegate?
    var sections: [SectionType] = [.basic, .annotation, .camera, .infoWindow]
    var sectionData: [SectionType: [RowData]] = [
        SectionType.basic: [.simpleMap],
        SectionType.annotation: [.bulkMarker, .dynamicMarker, .polygon, .polyline, .tapForMarker],
        SectionType.camera: [.animationTypes/*, .cameraPostion*/],
        SectionType.infoWindow: [.standardInfoWindow, .customInfoWindow]]


    // MARK: Initializer
    init(_ view: HomeViewDelegate) {
        self.homeView = view
    }

    // MARK: Methods
    func getSectionCount() -> Int {
        return sections.count
    }

    func getSectionTitle(for index: Int) -> String {
        return sections[index].rawValue
    }

    func getRowCount(for section: Int) -> Int {
        switch sections[section] {
        case .basic:
            return sectionData[.basic]?.count ?? 0
        case .annotation:
            return sectionData[.annotation]?.count ?? 0
        case .camera:
            return sectionData[.camera]?.count ?? 0
        case .infoWindow:
            return sectionData[.infoWindow]?.count ?? 0

        }
    }

    func viewModel(for index: IndexPath) -> HomeCellModel {
        switch sections[index.section] {
        case .basic:
            if let section = sectionData[.basic] {
                let rowData = section[index.row]
                return HomeCellModel(title: rowData.getTitle(), subtitle: rowData.getSubtitle())
            }
        case .annotation:
            if let section = sectionData[.annotation] {
                let rowData = section[index.row]
                return HomeCellModel(title: rowData.getTitle(), subtitle: rowData.getSubtitle())
            }
        case .camera:
            if let section = sectionData[.camera] {
                let rowData = section[index.row]
                return HomeCellModel(title: rowData.getTitle(), subtitle: rowData.getSubtitle())
            }
        case .infoWindow:
            if let section = sectionData[.infoWindow] {
                let rowData = section[index.row]
                return HomeCellModel(title: rowData.getTitle(), subtitle: rowData.getSubtitle())
            }
        }

        return HomeCellModel(title: "Empty", subtitle: "Empty")
    }

}
