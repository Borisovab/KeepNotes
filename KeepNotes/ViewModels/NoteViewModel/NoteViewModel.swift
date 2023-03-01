//
//  NoteViewModel.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import Foundation
import UIKit

class NoteViewModel {

    var newFont = Dynamic(UIFont.systemFont(ofSize: 14))

    var myNote: Note?
    var size: Int?
    var nameFont: String?
    var state: String?
    var descriptor: UIFontDescriptor?
    var font: UIFont?

    var fonts = ["bold", "noBold"]


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

}
