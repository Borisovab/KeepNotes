//
//  AppCoordinator.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var isLoggedIn: Bool = false

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        if isLoggedIn {
            presentSchedule(loginName: User.keys.first?.login ?? "")
        } else {
            presentLogin()
        }
    }

    func presentLogin() {
        let vc = LoginViewController.creatVC(viewController: LoginViewController(), title: "Hello!")
        vc.coordinator = self
        vc.viewModel = LoginViewModel()
        vc.viewModel?.isLoggedIn = isLoggedIn
        navigationController.pushViewController(vc, animated: true)
    }

    func presentSchedule(loginName: String) {
        let vc = ScheduleViewController.creatVC(viewController: ScheduleViewController(), title: "\(loginName)'s schedule")
        vc.coordinator = self
        vc.viewModel = ScheduleViewModel()
        vc.viewModel?.name = loginName

        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(vc, animated: true)
    }

    func presentNote() {
        let vc = NoteViewController.creatVC(viewController: NoteViewController(), title: "Add your Note")
        vc.coordinator = self
        vc.viewModel = NoteViewModel()

        navigationController.pushViewController(vc, animated: true)
    }


}
