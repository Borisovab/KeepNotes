//
//  LoginViewModel.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import Foundation
import UIKit.UIColor

class LoginViewModel {
    var statusText = Dynamic("")
    var statusColor = Dynamic(#colorLiteral(red: 0.8185969591, green: 1, blue: 0.6783949733, alpha: 1))
    var isLoggedIn = false

    func userPessedLoginButton(login: String, password: String) {
        let log = User.keys.first?.login
        let pass = User.keys.first?.password

        if login != log || password != pass {
            statusText.value = "Log in faild!"
            statusColor.value = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
            isLoggedIn = false
        } else {
            statusText.value = "You successfuly logged in!"
            statusColor.value = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
            isLoggedIn = true
        }
    }

}
