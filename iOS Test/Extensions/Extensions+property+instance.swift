//
//  Extensions.swift
//  iOS Test
//
//  Created by Гарик on 20.02.2023.
//

import UIKit

let isEmptyAlert: UIAlertController = {
    
    let alert = UIAlertController(title: "Ошибка", message: "Заполните пустые поля", preferredStyle: .alert)
    let action = UIAlertAction(title: "Ок", style: .cancel)
    alert.addAction(action)
    return alert
    
}()

let isValidEmailAlert: UIAlertController = {
    
    let alert = UIAlertController(title: "Ошибка", message: "Проверьте корректность ввода почты", preferredStyle: .alert)
    let action = UIAlertAction(title: "Ок", style: .cancel)
    alert.addAction(action)
    return alert
    
}()

let mainTabBar = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainTabBar")

extension UITextField {
    
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self.text)
    }
}
