//
//  PassReset.swift
//  iOS Test
//
//  Created by Гарик on 19.02.2023.
//

import UIKit

class PassResetController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    
    @IBAction func tapResetButton(_ sender: Any) {
        
        guard email.text?.isEmpty == false else {
            present(isEmptyAlert, animated: true)
            return
        }
        
        guard email.isValidEmail() == true else {
            present(isValidEmailAlert, animated: true)
            return
        }
        
        let alert = UIAlertController(title: "Успешно", message: "Инструкция по сбросу пароля придет Вам на почту", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .cancel) { [weak self] _ in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
