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
        italicsTF.inputView = italicsPicker
    }

    func addPickerDelegateAndDataSours() {
        sizePicker.dataSource = self
        sizePicker.delegate = self
        
        italicsPicker.dataSource = self
        italicsPicker.delegate = self

        italicsPicker.tag = 0
        sizePicker.tag = 1
    }

    func createToolBarForPicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonAction))

        toolbar.setItems([doneButton], animated: true)
        sizeTF.inputAccessoryView = toolbar
        italicsTF.inputAccessoryView = toolbar
    }

    @objc func doneButtonAction() {
        view.endEditing(true)
    }
}
