//
//  NoteViewModel.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import Foundation
import UIKit

class NoteViewModel {

    var myNote: Note?
    var noteState: NoteModel?
    //    var size: Int?
    //    var state: String?
    //    var descriptor: UIFontDescriptor?


    //    var fonts = ["bold", "noBold"]

    func changeTextConfigure(strStateArray: [String], _ textView: UITextView, _ descriptor: UIFontDescriptor?, _ size: Int?, _ state: String?) {

        if descriptor != nil {
            textView.font = UIFont(descriptor: descriptor!, size: CGFloat(size ?? 14))
            if state == strStateArray.first {
                textView.font = textView.font?.bold()
            } else if state == strStateArray.last {
                textView.font = textView.font?.noBold()
            }
        } else {
            textView.font = UIFont(name: "Arial", size: CGFloat(size ?? 14))
            if state == strStateArray.first {
                textView.font = textView.font?.bold()
            } else if state == strStateArray.last {
                textView.font = textView.font?.noBold()
            }
        }
    }





    // new
    func textOptions(_ textView: UITextView, _ note: NoteModel?) {
        guard let note = note else {
            return
        }


        if note.descriptor != nil {
            textView.font = UIFont(descriptor: note.descriptor!, size: CGFloat(note.size ?? 14))
            if note.strState == note.state.first {
                textView.font = textView.font?.bold()
            } else if note.strState == note.state.last {
                textView.font = textView.font?.noBold()
            }
        } else {
            textView.font = UIFont(name: "Arial", size: CGFloat(note.size ?? 14))
            if note.strState == note.state.first {
                textView.font = textView.font?.bold()
            } else if note.strState == note.state.last {
                textView.font = textView.font?.noBold()
            }
        }
    }











}



