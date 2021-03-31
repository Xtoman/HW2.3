//
//  ViewController.swift
//  HW2.3
//
//  Created by Maxim Zinchenko on 30.03.2021.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgetPasswordBTN: UIButton!
    @IBOutlet weak var forgetLoginBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 10.0
        forgetLoginBTN.layer.cornerRadius = 10.0
        forgetPasswordBTN.layer.cornerRadius = 10.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.login = loginTF.text
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginTF.text = ""
        passwordTF.text = ""
    }

    @IBAction func LoginButton(_ sender: Any) {
        let alert = UIAlertController(title: "Wrong Login or Password", message: "Check your data", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
 
        
        if loginTF.text != "Admin" || passwordTF.text != "admin" {
            self.present(alert, animated: true, completion: nil)
            loginTF.text?.removeAll()
            passwordTF.text?.removeAll()
        }
    }
    
    @IBAction func ForgetLoginPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Login remainder", message: "Your login is Admin", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func ForgetPasswordPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Password remainder", message: "Your password is admin", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let welcomeVC = segue.source as? WelcomeViewController else { return }
        loginTF.text = welcomeVC.welcomeLabel.text
        passwordTF.text = welcomeVC.password
        
    }
    
    
}

