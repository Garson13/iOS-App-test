//
//  Profile.swift
//  iOS Test
//
//  Created by Гарик on 19.02.2023.
//

import UIKit

class ProfileController: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    @IBAction func tapExitButton(_ sender: Any) {
        presentAlert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupValues()
    }
    
    private func setupValues() {
        name.text = User.shared.name
        email.text = User.shared.email
        userImage.image = UIImage(named: User.shared.imageName)
        
    }
    
    private func presentAlert() {
        let alert = UIAlertController(title: "Выход", message: "Вы уверены, что хотите выйти с аккаунта?", preferredStyle: .alert)
        let action = UIAlertAction(title: "Выход", style: .destructive) { [weak self] _ in
            UserDefaults.standard.removeObject(forKey: "isLoggedIn")
            let context = NewsModel.persistantContainer.viewContext
            let objects = try? context.fetch(NewsData.fetchRequest())
            objects?.forEach { data in
                context.delete(data)
            }
            do {
                try context.save()
            } catch let error {
                print(error.localizedDescription)
            }
            guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() else {return}
            self?.present(vc, animated: true)
        }
        let action2 = UIAlertAction(title: "Отмена", style: .cancel)
        alert.addAction(action)
        alert.addAction(action2)
        present(alert, animated: true)
    }
}
