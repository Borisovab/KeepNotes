//
//  NoteVC+errorAlert.swift
//  KeepNotes
//
//  Created by Александр Борисов on 26.02.2023.
//

import UIKit


extension NoteViewController {
    func errorAlert() {
        let alert = UIAlertController(title: "Error", message: "You didn't enter a note name", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        present(alert, animated: true)
    }
}
