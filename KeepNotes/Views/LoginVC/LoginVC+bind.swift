//
//  LoginVC+bind.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import UIKit

extension LoginViewController {
    func bindViewModel() {
        guard let viewModel = viewModel
        else { return }

        viewModel.statusText.bind { statusText in
            DispatchQueue.main.async {
                self.statusLabel.text = statusText
            }
        }

        viewModel.statusColor.bind { statusColor in
            DispatchQueue.main.async {
                self.statusLabel.textColor = statusColor
            }
        }
    }
}
