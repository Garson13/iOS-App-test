//
//  Model.swift
//  iOS Test
//
//  Created by Гарик on 20.02.2023.
//

import UIKit

struct User {
    let id: Int
    let name: String
    let email: String
    let password: String
    let imageName: String
    
    static let shared = User(id: 1, name: "Cristiano", email: "test@mail.ru", password: "123456", imageName: "криш")
}
