//
//  LoginVC.swift
//  StarWarsAPITest
//
//  Created by Kent Franks on 2/19/19.
//  Copyright © 2019 Kent Franks. All rights reserved.
//

import UIKit
import NetStak

class LoginVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var discoModeLabel: UILabel!
    @IBOutlet weak var discoModeSwitch: UISwitch!
    @IBOutlet weak var loginButton: UIButton!

    // MARK: - Properties
    let session = NetStakSession.shared

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if session.environment == .dev {
            discoModeSwitch.isHidden = false
            discoModeLabel.isHidden = false
        } else {
            discoModeSwitch.isHidden = true
            discoModeLabel.isHidden = true
        }
    }
    
    // MARK: - Actions
    @IBAction func loginAction(_ sender: Any) {
        if discoModeSwitch.isOn {
            session.environment = .mock
        }
    }
    
}
