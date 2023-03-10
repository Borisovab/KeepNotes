//
//  Singleton.swift
//  KeepNotes
//
//  Created by Александр Борисов on 03.03.2023.
//

import UIKit

class Singleton {
    static let shared = Singleton()
    private init() {}
    var strStyleName = ""
    var range = NSRange(location: 0, length: 0)
}
