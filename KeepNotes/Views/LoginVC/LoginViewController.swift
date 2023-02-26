//
//  ViewController.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import UIKit

class LoginViewController: UIViewController, Adapter {

    weak var coordinator: AppCoordinator?
    var viewModel: LoginViewModel?

    var loginScreen: UILabel = {
        let label = UILabel()
        label.text = "Login Screen"
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.textAlignment = .center
        return label
    }()

    var loginTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your login:"
        return textField
    }()

    var passwordTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your password:"
        return textField
    }()

    lazy var logsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .fill
        stack.distribution = .fillEqually

        [loginTF, passwordTF].forEach{ stack.addArrangedSubview($0) }
        return stack
    }()

    var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enter", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        return button
    }()

    var statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.textAlignment = .center
        return label
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8603735566, green: 0.9964947104, blue: 0.8555072546, alpha: 1)
        setupConstraints()
        bindViewModel()
        enterButtonPressed()
    }

}

