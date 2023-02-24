//
//  User.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import UIKit

struct User {
    var login: String
    var password: String
}

extension User {
    static var keys = [
        User(login: "111", password: "111")
    ]
}
