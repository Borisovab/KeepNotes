//
//  NoteVC+saveButtonAction.swift
//  KeepNotes
//
//  Created by Александр Борисов on 25.02.2023.
//

import UIKit

extension NoteViewController {

    func seveButtonPressed() {
        seveButton.addTarget(self, action: #selector(seveButtonAction), for: .touchUpInside)
    }

    @objc func seveButtonAction() {
        if saveNote() {
            coordinator?.presentSchedule()
        }
    }
}
