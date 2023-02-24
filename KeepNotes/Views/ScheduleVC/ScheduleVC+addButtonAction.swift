//
//  ScheduleVC+addButtonAction.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import UIKit

extension ScheduleViewController {
    func addNavItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addNoteButtonAction))
        self.navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.9909122586, green: 0.6400651336, blue: 0, alpha: 1)
    }

    @objc func addNoteButtonAction() {
        coordinator?.presentNote()
    }
}
