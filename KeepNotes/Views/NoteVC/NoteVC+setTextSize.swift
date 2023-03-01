//
//  NoteVC+setTextSize.swift
//  KeepNotes
//
//  Created by Александр Борисов on 28.02.2023.
//

import UIKit

extension NoteViewController {
    func setTextSize() {
        let size = viewModel?.size
        let descriptor = viewModel?.descriptor
        let state = viewModel?.state

        if descriptor != nil {
            noteTextView.font = UIFont(descriptor: descriptor!, size: CGFloat(size ?? 14))
            if state == viewModel?.fonts[0] {
                self.noteTextView.font = self.noteTextView.font?.bold()
            } else if state == viewModel?.fonts[1] {
                self.noteTextView.font = self.noteTextView.font?.noBold()
            }
        } else {
            noteTextView.font = UIFont(name: "Arial", size: CGFloat(size ?? 14))
            if state == viewModel?.fonts[0] {
                self.noteTextView.font = self.noteTextView.font?.bold()
            } else if state == viewModel?.fonts[1] {
                self.noteTextView.font = self.noteTextView.font?.noBold()
            }
        }

        sizeTF.text = String(size ?? 14)
        italicsTF.text = state

        noteTextView.reloadInputViews()
    }


}
