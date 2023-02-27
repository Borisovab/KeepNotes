//
//  NoteViewController.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import UIKit
import CoreData

class NoteViewController: UIViewController, Adapter {

    weak var coordinator: AppCoordinator?
    var viewModel: NoteViewModel?

    var fontButton: UIButton = {
        let button = UIButton()
        button.setTitle("Font", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6917473674, green: 0.8152458668, blue: 0.7281364799, alpha: 1)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 3
        button.layer.borderColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).withAlphaComponent(0.7).cgColor
        return button
    }()

    var italicsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Italics", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6917473674, green: 0.8152458668, blue: 0.7281364799, alpha: 1)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 3
        button.layer.borderColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).withAlphaComponent(0.7).cgColor
        return button
    }()

    var sizeTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Size: "
        textField.textAlignment = .center
        textField.text = "14"
        textField.backgroundColor = #colorLiteral(red: 0.6917473674, green: 0.8152458668, blue: 0.7281364799, alpha: 1)
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 3
        textField.layer.borderColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).withAlphaComponent(0.7).cgColor
        return textField
    }()

    var sizePicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()

    lazy var fontStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .fill
        stack.distribution = .fillEqually

        [fontButton, italicsButton, sizeTF].forEach{ stack.addArrangedSubview($0) }
        return stack
    }()

    var noteHeaderTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter a name for your note (required):"
        return textField
    }()

    var noteTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textView.textAlignment = .justified
        textView.isEditable = true
        textView.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return textView
    }()

    var seveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save note", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6917473674, green: 0.8152458668, blue: 0.7281364799, alpha: 1)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 6
        button.layer.borderColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).withAlphaComponent(0.7).cgColor
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8603735566, green: 0.9964947104, blue: 0.8555072546, alpha: 1)
        setupConstraints()
        seveButtonPressed()
        readObject()
        setTextSize()
        fontButtonPressed()

        createToolBarForPicker()
        pickerToTextField()
        addPickerDelegateAndDataSours()
    }

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

    func setTextSize() {
        let size = viewModel?.size

        let descriptor = viewModel?.descriptor
        guard let descriptor = descriptor
        else { return }

        sizeTF.text = String(size ?? 14)
        noteTextView.font = UIFont(descriptor: descriptor, size: CGFloat(size ?? 14))
        noteTextView.reloadInputViews()
    }


}


//MARK: - UIFontPickerViewControllerDelegate
extension NoteViewController: UIFontPickerViewControllerDelegate {
    func fontPickerViewControllerDidCancel(_ viewController: UIFontPickerViewController) {
        viewController.dismiss(animated: true)
    }

    func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
        viewController.dismiss(animated: true)

        guard let descriptor = viewController.selectedFontDescriptor
        else { return }
        viewModel?.descriptor = descriptor

        let size = viewModel?.size
        noteTextView.font = UIFont(descriptor: descriptor, size: CGFloat(size ?? 14))
    }
}


//MARK: - UIPickerViewDataSource
extension NoteViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 30
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
}

//MARK: - UIPickerViewDelegate
extension NoteViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        sizeTF.text = String(row)
        viewModel?.size = row
        setTextSize()
    }
}
