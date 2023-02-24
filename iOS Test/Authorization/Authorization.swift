//
//  Authorization.swift
//  iOS Test
//
//  Created by Гарик on 19.02.2023.
//

import UIKit

class AuthorizationController: UIViewController {

    private var isLoggedIn = false
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func tapLoginButton(_ sender: Any) {
        
        guard email.text?.isEmpty == false, password.text?.isEmpty == false else {
            present(isEmptyAlert, animated: true)
            return
        }
        
        guard email.isValidEmail() == true else {
            present(isValidEmailAlert, animated: true)
            return
        }
        
        if email.text == User.shared.email, password.text == User.shared.password {
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            present(mainTabBar, animated: true)
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Указан неправильный логин или пароль", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ок", style: .cancel)
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func configuration() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.5306391716, green: 0.6479418278, blue: 0.8934077621, alpha: 1)
    }
}
