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
            presentSchedule()
        } else {
            presentLogin()
        }
    }

    //MARK: - загрузка LoginViewController
    func presentLogin() {
        let vc = LoginViewController.creatVC(viewController: LoginViewController(), title: "Hello!")
        vc.coordinator = self
        vc.viewModel = LoginViewModel()
        vc.viewModel?.isLoggedIn = isLoggedIn
        navigationController.pushViewController(vc, animated: true)
    }

    //MARK: - загрузка ScheduleViewController
    func presentSchedule() {
        let vc = ScheduleViewController.creatVC(viewController: ScheduleViewController(), title: "Schedule")
        vc.coordinator = self
        vc.viewModel = ScheduleViewModel()

        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(vc, animated: true)
    }

    //MARK: - загрузка NoteViewController (для создания новой заметки)
    func presentNote() {
        let vc = NoteViewController.creatVC(viewController: NoteViewController(), title: "Add your Note")
        vc.coordinator = self
        vc.viewModel = NoteViewModel()

        navigationController.pushViewController(vc, animated: true)
    }

    //MARK: - загрузка NoteViewController (для редактирования существующей заметки)
    func showNoteToCorrectIt(note: Note) {
        let vc = NoteViewController.creatVC(viewController: NoteViewController(), title: "Correct your note")
        vc.coordinator = self
        vc.viewModel = NoteViewModel()
        vc.viewModel?.myNote = note

        navigationController.pushViewController(vc, animated: true)
    }
}
