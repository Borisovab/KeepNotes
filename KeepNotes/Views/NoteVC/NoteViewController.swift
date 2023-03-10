//
//  NoteViewController.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import UIKit
import CoreData
import SnapKit

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

    var sizeTF: UITextField = {
        let textField = UITextField()
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


    var boldButton: UIButton = {
        let button = UIButton()
        button.setTitle("  𝐁  ", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6917473674, green: 0.8152458668, blue: 0.7281364799, alpha: 1)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 3
        button.layer.borderColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).withAlphaComponent(0.7).cgColor
        return button
    }()

    var italicButton: UIButton = {
        let button = UIButton()
        button.setTitle("  ∕  ", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6917473674, green: 0.8152458668, blue: 0.7281364799, alpha: 1)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 3
        button.layer.borderColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).withAlphaComponent(0.7).cgColor
        return button
    }()

    var colorButton: UIButton = {
        let button = UIButton()
        button.setTitle("  🟡  ", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6917473674, green: 0.8152458668, blue: 0.7281364799, alpha: 1)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 3
        button.layer.borderColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).withAlphaComponent(0.7).cgColor
        return button
    }()

    var headerSizeButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Header ", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6917473674, green: 0.8152458668, blue: 0.7281364799, alpha: 1)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 3
        button.layer.borderColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).withAlphaComponent(0.7).cgColor
        return button
    }()


    lazy var fontStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .fill
        stack.distribution = .fill

        [fontButton, boldButton, italicButton, colorButton, headerSizeButton].forEach{ stack.addArrangedSubview($0) }
        return stack
    }()

    var noteHeaderTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter a name for your note (required):"
        return textField
    }()

    var noteTextView: UITextView!

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

        viewModel?.noteState = NoteModel()
        configureTextView()
        setupConstraints()

        seveButtonPressed()
        readObject()

        fontButtonPressed()
        boldFontButtonPressed()
        italicFontButtonPressed()
        colorFontButtonPressed()
        headerSizeButtonPressed()

// относится к пикеру, который должен был менять размер текста. Пока не реализовано, но в перспективе нужно реализовать такую возможность
//        createToolBarForPicker()
//        pickerToTextField()
//        addPickerDelegateAndDataSours()
    }

    private func configureTextView() {
        noteTextView = UITextView()
        noteTextView.delegate = self
        noteTextView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        noteTextView.textAlignment = .justified
        noteTextView.isEditable = true
        noteTextView.isSelectable = true
        noteTextView.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
}


//MARK: - UIFontPickerViewControllerDelegate
extension NoteViewController: UIFontPickerViewControllerDelegate {
    func fontPickerViewControllerDidCancel(_ viewController: UIFontPickerViewController) {
        viewController.dismiss(animated: true)
    }

    func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
        viewController.dismiss(animated: true)

        guard let strDescriptor = viewController.selectedFontDescriptor?.postscriptName
        else { return }

        viewModel?.noteState?.nameStyle = strDescriptor
        print(strDescriptor)

        Singleton.shared.strStyleName = strDescriptor

        changeStyle(strDescriptor)

    }
}


//MARK: - UIPickerViewDataSource
extension NoteViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 26
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return String(row)
    }
}

//MARK: - UIPickerViewDelegate
extension NoteViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        viewModel?.noteState?.changedSize = row
        setTextSize(row)
    }
}




extension NoteViewController: UITextViewDelegate {




}





