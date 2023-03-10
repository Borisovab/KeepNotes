//
//  NoteVC+configurePickers.swift
//  KeepNotes
//
//  Created by Александр Борисов on 28.02.2023.
//

import UIKit

extension NoteViewController {
    func pickerToTextField() {
        sizeTF.inputView = sizePicker
    }

    func addPickerDelegateAndDataSours() {
        sizePicker.dataSource = self
        sizePicker.delegate = self
    }

    func createToolBarForPicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonAction))

        toolbar.setItems([doneButton], animated: true)
        sizeTF.inputAccessoryView = toolbar
    }

    @objc func doneButtonAction() {
        view.endEditing(true)
    }
}
