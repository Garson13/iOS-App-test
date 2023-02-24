//
//  Registration.swift
//  iOS Test
//
//  Created by Гарик on 19.02.2023.
//

import UIKit

class RegistrationController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func tapLogInButton(_ sender: Any) {
        
        guard email.text?.isEmpty == false, password.text?.isEmpty == false else {
            present(isEmptyAlert, animated: true)
            return
        }
        
        guard email.isValidEmail() == true else {
            present(isValidEmailAlert, animated: true)
            return
        }
        
        present(mainTabBar, animated: true)
    }
    
    @IBAction func tapBackAuthorizationButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
