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

    let scheduleTableViewCellReuseIdentifier = "scheduleTableViewCellReuseIdentifier"

    lazy var scheduleTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ScheduleTableViewCell.self, forCellReuseIdentifier: scheduleTableViewCellReuseIdentifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8603735566, green: 0.9964947104, blue: 0.8555072546, alpha: 1)
        setupConstraints()
        addNavItem()
    }

}

extension ScheduleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: scheduleTableViewCellReuseIdentifier, for: indexPath) as? ScheduleTableViewCell
        else { return UITableViewCell() }

        return cell
    }


}

extension ScheduleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
