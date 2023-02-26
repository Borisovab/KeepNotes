//
//  ScheduleViewController.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import UIKit
import CoreData

class ScheduleViewController: UIViewController, Adapter {

    weak var coordinator: AppCoordinator?
    var viewModel: ScheduleViewModel?

    lazy var scheduleTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ScheduleTableViewCell.self, forCellReuseIdentifier: ScheduleViewModel.Constant.cellName)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8603735566, green: 0.9964947104, blue: 0.8555072546, alpha: 1)
        setupConstraints()
        addNavItem()
        setFetchResult()
    }
}


// MARK: - UITableViewDataSource
extension ScheduleViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let myNote = viewModel?.fetchResultController.object(at: indexPath) as? Note
            else { return }
            CoreDataManager.instance.context.delete(myNote)
            CoreDataManager.instance.saveContext()
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.fetchResultController.sections?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = viewModel?.fetchResultController.sections {
            return sections[section].numberOfObjects
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleViewModel.Constant.cellName, for: indexPath) as? ScheduleTableViewCell
        else { return UITableViewCell() }

        guard let note = viewModel?.fetchResultController.object(at: indexPath) as? Note
        else { return UITableViewCell() }

        cell.configureScheduleCell(index: indexPath, note: note)
        return cell
    }
}


// MARK: - UITableViewDelegate
extension ScheduleViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let myNote = viewModel?.fetchResultController.object(at: indexPath) as? Note
        else { return }
        coordinator?.showNoteToCorrectIt(note: myNote)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}


// MARK: - NSFetchedResultsControllerDelegate
extension ScheduleViewController: NSFetchedResultsControllerDelegate {

    // информирует о начале изменения данных
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        scheduleTableView.beginUpdates()
    }


    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
                scheduleTableView.insertRows(at: [indexPath], with: .automatic)
            }

        case .delete:
            if let indexPath = indexPath {
                self.scheduleTableView.deleteRows(at: [indexPath], with: .automatic)
            }
        case .move:
            if let indexPath = indexPath {
                self.scheduleTableView.deleteRows(at: [indexPath], with: .automatic)
            }

            if let indexPath = newIndexPath {
                self.scheduleTableView.insertRows(at: [indexPath], with: .automatic)

            }
            self.scheduleTableView.reloadData()
        case .update:
            if let indexPath = indexPath {
                guard let myNote = viewModel?.fetchResultController.object(at: indexPath) as? Note
                else { return }

                guard let cell = self.scheduleTableView.dequeueReusableCell(withIdentifier: ScheduleViewModel.Constant.cellName, for: indexPath) as? ScheduleTableViewCell
                else { return  }

                cell.configureScheduleCell(index: indexPath, note: myNote)
            }
        default:
            break
        }
    }


    // информирует об окончании измения данных
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        scheduleTableView.endUpdates()
    }
}
