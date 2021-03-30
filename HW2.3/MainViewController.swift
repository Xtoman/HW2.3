//
//  ViewController.swift
//  HW2.3
//
//  Created by Maxim Zinchenko on 30.03.2021.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var LoginTF: UITextField!
    @IBOutlet weak var PasswordTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.login = LoginTF.text
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        LoginTF.text = ""
        PasswordTf.text = ""
    }

    @IBAction func LoginButton(_ sender: Any) {
        let alert = UIAlertController(title: "Wrong Login or Password", message: "Check your data", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
 
        
        if LoginTF.text != "Admin" || PasswordTf.text != "admin" {
            self.present(alert, animated: true, completion: nil)
            LoginTF.text?.removeAll()
            PasswordTf.text?.removeAll()
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
        LoginTF.text = welcomeVC.welcomeLabel.text
        PasswordTf.text = welcomeVC.password
        
    }
    
    
}

