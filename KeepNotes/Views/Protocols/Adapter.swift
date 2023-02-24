//
//  Adapter.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import UIKit

protocol Adapter {
    static func creatVC(viewController: UIViewController, title: String) -> Self
}

extension Adapter where Self: UIViewController {
    static func creatVC(viewController: UIViewController, title: String) -> Self {
        viewController.title = title
        return viewController as! Self
    }
}
