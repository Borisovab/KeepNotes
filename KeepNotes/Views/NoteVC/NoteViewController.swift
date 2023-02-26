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
        button.backgroundColor = #colorLiteral(red: 0.9909122586, green: 0.6400651336, blue: 0, alpha: 1)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8603735566, green: 0.9964947104, blue: 0.8555072546, alpha: 1)
        setupConstraints()
        seveButtonPressed()
        readObject()
    }
}
