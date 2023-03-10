//
//  NoteVC+setTextSize.swift
//  KeepNotes
//
//  Created by Александр Борисов on 28.02.2023.
//

import UIKit

extension NoteViewController {
    func setTextSize(_ changedSize: Int) {
        guard let viewModel = viewModel
        else { return }

        let styleName = viewModel.noteState?.nameStyle
        guard let styleName = styleName
        else { return }

//        let size = viewModel.noteState?.changedSize
//        guard let size = size
//        else { return }

        if let text = noteTextView {

            let range = text.selectedRange
            print("range from setTextSize ====>\(range)")
            let string = NSMutableAttributedString(attributedString:
                                                    noteTextView.attributedText)

            let trivialAttribute = [
                NSAttributedString.Key.font: UIFont(name: styleName, size: CGFloat(changedSize))
            ]

            string.addAttributes(trivialAttribute as [NSAttributedString.Key : Any], range: noteTextView.selectedRange)

            noteTextView.attributedText = string
            noteTextView.selectedRange = range
        }

        sizeTF.text = String(changedSize)
        noteTextView.reloadInputViews()

    }

    func changeStyle(_ nameStyle: String) {
        let name = viewModel?.noteState?.nameStyle
        let size = viewModel?.noteState?.size
        guard let name = name
        else { return }

        guard let size = size
        else { return }

        noteTextView.font = UIFont(name: name, size: CGFloat(size))
    }


}
