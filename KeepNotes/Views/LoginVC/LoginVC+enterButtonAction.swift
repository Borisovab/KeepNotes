//
//  LoginVC+enterButtonAction.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import UIKit

extension LoginViewController {
    func enterButtonPressed() {
        enterButton.addTarget(self, action: #selector(LoginViewController), for: .touchUpInside)
    }

    @objc func LoginViewController() {
        guard let viewModel = viewModel
        else { return }

        viewModel.userPessedLoginButton(login: (loginTF.text ?? ""), password: (passwordTF.text ?? ""))

        if viewModel.isLoggedIn {
            coordinator?.isLoggedIn = viewModel.isLoggedIn
            coordinator?.presentSchedule(loginName: loginTF.text ?? "")
        }
    }
}
