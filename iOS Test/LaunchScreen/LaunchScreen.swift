//
//  LaunchScreen.swift
//  iOS Test
//
//  Created by Гарик on 24.02.2023.
//

import UIKit

class LaunchScreen: UIViewController {
    
    private var isLoggedIn = false
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sleep(2)
        loggedIn()
    }
    
    private func loggedIn() {
        isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        if isLoggedIn {
            present(mainTabBar, animated: true)
        } else {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainNav")
            present(vc, animated: true)
        }
    }

}
