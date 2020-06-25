//
//  HomeTableViewCell.swift
//  FlightMap-Demo-iOS
//
//  Created by Intern on 23/06/20.
//  Copyright © 2020 Intern. All rights reserved.
//

import UIKit

struct HomeCellModel {
    var title = String()
    var subtitle = String()

    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }
}

class HomeTableViewCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!

    // MARK: Properties
    var dataModel: HomeCellModel? {
        didSet {
            setupCellData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: Methods
    private func setupCellData() {
        if let model = dataModel {
            self.titleLabel.text = model.title
            self.secondaryLabel.text = model.subtitle
        }
    }

    func setupCellModel(with model: HomeCellModel) {
        self.dataModel = model
    }
    
}
