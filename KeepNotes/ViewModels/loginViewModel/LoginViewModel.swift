//
//  LoginViewModel.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import Foundation

class LoginViewModel {
    var statusText = Dynamic("")
    var isLoggedIn = false

    func userPessedLoginButton(login: String, password: String) {
        let log = User.keys.first?.login
        let pass = User.keys.first?.password

        if login != log || password != pass {
            statusText.value = "Log in faild!"
            isLoggedIn = false
        } else {
            statusText.value = "You successfuly logged in!"
            isLoggedIn = true
        }
    }

}
