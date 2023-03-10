//
//  NoteVC+textAdjusterTools.swift
//  KeepNotes
//
//  Created by Александр Борисов on 03.03.2023.
//

import UIKit

extension NoteViewController {
    //MARK: - Bold
    func boldFontButtonPressed() {
        boldButton.addTarget(self, action: #selector(tapBolt), for: .touchUpInside)
    }

    @objc func tapBolt() {
        guard let viewModel = viewModel
        else { return }

        let styleName = viewModel.noteState?.nameStyle
        guard let styleName = styleName
        else { return }

        if let text = noteTextView {
            let range = text.selectedRange

            let string = NSMutableAttributedString(attributedString: noteTextView.attributedText)

            let boldAttribute = [
                NSAttributedString.Key.font: UIFont(name: styleName, size: 14)?.bold()
            ]

            let trivialAttribute = [
                NSAttributedString.Key.font: UIFont(name: styleName, size: 14)
            ]

            if viewModel.boldFlag == false {
                string.addAttributes(boldAttribute as [NSAttributedString.Key : Any], range: noteTextView.selectedRange)
                viewModel.boldFlag = true
            } else {
                string.addAttributes(trivialAttribute as [NSAttributedString.Key : Any], range: noteTextView.selectedRange)
                viewModel.boldFlag = false
            }

            noteTextView.attributedText = string
            noteTextView.selectedRange = range
        }
    }

    //MARK: - Italic
    func italicFontButtonPressed() {
        italicButton.addTarget(self, action: #selector(tapItalic), for: .touchUpInside)
    }

    @objc func tapItalic() {
        guard let viewModel = viewModel
        else { return }

        let styleName = viewModel.noteState?.nameStyle
        guard let styleName = styleName
        else { return }

        if let text = noteTextView {
            let range = text.selectedRange

            let string = NSMutableAttributedString(attributedString: noteTextView.attributedText)

            let boldAttribute = [
                NSAttributedString.Key.font: UIFont(name: styleName, size: 14)?.italic()
            ]

            let trivialAttribute = [
                NSAttributedString.Key.font: UIFont(name: styleName, size: 14)
            ]

            if viewModel.italicFlag == false {
                string.addAttributes(boldAttribute as [NSAttributedString.Key : Any], range: noteTextView.selectedRange)
                viewModel.italicFlag = true
            } else {
                string.addAttributes(trivialAttribute as [NSAttributedString.Key : Any], range: noteTextView.selectedRange)
                viewModel.italicFlag = false
            }

            noteTextView.attributedText = string
            noteTextView.selectedRange = range
        }
    }

    //MARK: - Color
    func colorFontButtonPressed() {
        colorButton.addTarget(self, action: #selector(tapColor), for: .touchUpInside)
    }

    @objc func tapColor() {
        guard let viewModel = viewModel
        else { return }

        if let text = noteTextView {
            let range = text.selectedRange

            let string = NSMutableAttributedString(attributedString: noteTextView.attributedText)

            let yellowColorAttribute = [
                NSAttributedString.Key.backgroundColor: UIColor.yellow
            ]

            let clearColorAttribute = [
                NSAttributedString.Key.backgroundColor: UIColor.clear
            ]

            if viewModel.colorFlag == false {
                string.addAttributes(yellowColorAttribute as [NSAttributedString.Key : Any], range: noteTextView.selectedRange)
                viewModel.colorFlag = true
            } else {
                string.addAttributes(clearColorAttribute as [NSAttributedString.Key : Any], range: noteTextView.selectedRange)
                viewModel.colorFlag = false
            }

            noteTextView.attributedText = string
            noteTextView.selectedRange = range
        }
    }

    //MARK: - Header Size
    func headerSizeButtonPressed() {
        headerSizeButton.addTarget(self, action: #selector(tapheaderSize), for: .touchUpInside)
    }

    @objc func tapheaderSize() {
        guard let viewModel = viewModel
        else { return }

        let styleName = viewModel.noteState?.nameStyle
        guard let styleName = styleName
        else { return }

        if let text = noteTextView {
            let range = text.selectedRange

            let string = NSMutableAttributedString(attributedString: noteTextView.attributedText)

            let headerSizeAttribute = [
                NSAttributedString.Key.font: UIFont(name: styleName, size: 18)
            ]

            let trivialAttribute = [
                NSAttributedString.Key.font: UIFont(name: styleName, size: 14)
            ]

            if viewModel.sizeFlag == false {
                string.addAttributes(headerSizeAttribute as [NSAttributedString.Key : Any], range: noteTextView.selectedRange)
                viewModel.sizeFlag = true
            } else {
                string.addAttributes(trivialAttribute as [NSAttributedString.Key : Any], range: noteTextView.selectedRange)
                viewModel.sizeFlag = false
            }

            noteTextView.attributedText = string
            noteTextView.selectedRange = range
        }
    }
}
