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

        let size = viewModel.noteState?.size
        let isBold = viewModel.noteState?.strState
        
//        let array = viewModel.fonts
//        let size = viewModel.size
//        let descriptor = viewModel.descriptor
//        let state = viewModel.state
//
//        viewModel.changeTextConfigure(boldState: array, noteTextView, descriptor, size, state)

//        viewModel.changeTextConfigure(noteTextView)


        viewModel.textOptions(noteTextView, viewModel.noteState)

        sizeTF.text = String(size ?? 14)
        isBoldTF.text = isBold

        noteTextView.reloadInputViews()
    }


}
