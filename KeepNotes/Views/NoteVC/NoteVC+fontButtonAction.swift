//
//  NoteVC+fontButtonAction.swift
//  KeepNotes
//
//  Created by Александр Борисов on 27.02.2023.
//

import UIKit

extension NoteViewController {
    func fontButtonPressed() {
        fontButton.addTarget(self, action: #selector(fontButtonAction), for: .touchUpInside)
    }

    @objc func fontButtonAction() {
        let config = UIFontPickerViewController.Configuration()
        config.includeFaces = false
        let vc = UIFontPickerViewController(configuration: config)
        vc.delegate = self
        present(vc, animated: true)
    }
}
