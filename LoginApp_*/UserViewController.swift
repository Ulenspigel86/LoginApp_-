//
//  UserViewController.swift
//  LoginApp_*
//
//  Created by Артем Иванов on 25.10.2024.
//

import UIKit

final class UserViewController: UIViewController {
    
   @IBOutlet var logoutButton: UIButton!
    
    var user: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutButton.layer.cornerRadius = 10
    }
}
