//
//  Coordinator.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController {get set}

    func start()
}
