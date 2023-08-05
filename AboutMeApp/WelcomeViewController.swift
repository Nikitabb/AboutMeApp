//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by Никита on 05.08.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {

 
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var greetingHandLabel: UILabel!
    
    var welcomeUserName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingHandLabel.text = "👋"
        userNameLabel.text = welcomeUserName
    }

    @IBAction func logOutDidTapped() {
        dismiss(animated: true)
    }
}
