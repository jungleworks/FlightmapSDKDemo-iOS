//
//  LoginViewController.swift
//  FlightMap-Demo-iOS
//
//  Created by Intern on 22/06/20.
//  Copyright © 2020 Intern. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var tokenTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var getAccessTokenButton: UIButton!

    // MARK: Properties


    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStrings()
        setupViews()
    }


    // MARK: Methods

    private func setupViews() {
        self.navigationController?.isNavigationBarHidden = true
    }
    private func setupStrings() {
        tokenTextField.placeholder = TEXT.placeholder_login
        getAccessTokenButton.setTitle(TEXT.getAccessToken_login, for: .normal)
    }

    /// Check access token validity
    private func isAccessTokenValid() -> Bool {
        return true
    }

    private func pushToHome() {
        let storyboard = UIStoryboard(name: STORYBOARD.main, bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: IDENTIFIER.homeViewController)
        self.navigationController?.pushViewController(viewController, animated: true)

    }

    // MARK: Action
    @IBAction func loginAction(_ sender: Any) {
        if self.isAccessTokenValid() {
            self.pushToHome()
        } else {
            /// Show alert for invalid token
        }
    }

    @IBAction func getAccessToken(_ sender: Any) {

    }
}
