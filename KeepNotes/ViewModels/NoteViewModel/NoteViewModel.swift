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

}
