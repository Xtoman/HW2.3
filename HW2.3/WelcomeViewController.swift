//
//  WelcomeViewController.swift
//  HW2.3
//
//  Created by Maxim Zinchenko on 30.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var login: String!
    var password: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(login ?? "")!"
    }
    
    @IBAction func LogOutButton(_ sender: Any) {
        welcomeLabel.text?.removeAll()
        password = ""
        dismiss(animated: true)
    }
    
   

}
