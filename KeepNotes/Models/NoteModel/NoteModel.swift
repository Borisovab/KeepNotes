//
//  NoteModel.swift
//  KeepNotes
//
//  Created by Александр Борисов on 02.03.2023.
//

import UIKit

class NoteModel {
//    let id: Int
    var size: Int?
    let state = ["bold", "noBold"]
    var strState: String?
    var nameStyle: String?

    var descriptor: UIFontDescriptor?

    init(
//        id: Int,
         size: Int?,
         strState: String?,
         descriptor: UIFontDescriptor?,
         nameStyle: String?
    ) {
//        self.id = id
        self.size = size
        self.strState = strState
        self.descriptor = descriptor
        self.nameStyle = nameStyle
    }

    convenience init() {
        self.init(size: nil, strState: nil, descriptor: nil, nameStyle: nil)
    }


}


