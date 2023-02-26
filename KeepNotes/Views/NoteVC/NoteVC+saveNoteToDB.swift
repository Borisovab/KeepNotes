//
//  NoteVC+saveNoteToDB.swift
//  KeepNotes
//
//  Created by Александр Борисов on 26.02.2023.
//

import UIKit
import CoreData


extension NoteViewController {
    func saveNote() -> Bool {

        if noteHeaderTF.text!.isEmpty {
            errorAlert()
            return false
        }

        // создаем объект
        var myNote = viewModel?.myNote

        if myNote == nil {
            myNote = Note()
        }

        // сохранить объект
        if let myNote = myNote {
            myNote.noteHeader = noteHeaderTF.text
            myNote.noteBody = noteTextView.text
            CoreDataManager.instance.saveContext()
        }

        return true
    }
}
