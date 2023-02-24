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
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        return button
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 0.6510761589)
        setupConstraints()
        enterButtonPressed()
    }


}

