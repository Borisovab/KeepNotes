//
//  NoteVC+setTextSize.swift
//  KeepNotes
//
//  Created by Александр Борисов on 28.02.2023.
//

import UIKit

extension NoteViewController {
    func setTextSize() {
        guard let viewModel = viewModel
        else { return }

        let array = viewModel.fonts
        let size = viewModel.size
        let descriptor = viewModel.descriptor
        let state = viewModel.state

        viewModel.changeTextConfigure(strStateArray: array, noteTextView, descriptor, size, state)

        sizeTF.text = String(size ?? 14)
        italicsTF.text = state

        noteTextView.reloadInputViews()
    }


}
