//
//  ScheduleViewController.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import UIKit

class ScheduleViewController: UIViewController, Adapter {

    weak var coordinator: AppCoordinator?
    var viewModel: ScheduleViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    }
}
