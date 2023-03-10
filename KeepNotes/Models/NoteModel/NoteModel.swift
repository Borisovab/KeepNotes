//
//  NoteModel.swift
//  KeepNotes
//
//  Created by Александр Борисов on 02.03.2023.
//

import UIKit

class NoteModel {
//    let id: Int
    var size = 14
    var changedSize: Int?
    let state = ["bold", "noBold"]
    var strState: String?
    var nameStyle = "Arial"

    var descriptor: UIFontDescriptor?

    init(
//        id: Int,
//         size: Int?,
//         strState: String?,
         descriptor: UIFontDescriptor?,
         changedSize: Int?
//         nameStyle: String?
    ) {
//        self.id = id
//        self.size = size
//        self.strState = strState
        self.descriptor = descriptor
        self.changedSize = changedSize
//        self.nameStyle = nameStyle
    }

    convenience init() {
        self.init(descriptor: nil, changedSize: nil)
    }


}


