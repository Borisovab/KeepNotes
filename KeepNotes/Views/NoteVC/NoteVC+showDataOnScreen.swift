//
//  NoteVC+showDataOnScreen.swift
//  KeepNotes
//
//  Created by Александр Борисов on 26.02.2023.
//

import Foundation

extension NoteViewController {
    func readObject() {
        if let note = viewModel?.myNote {
            self.noteHeaderTF.text = note.noteHeader
            self.noteTextView.text = note.noteBody
        }
    }
}
