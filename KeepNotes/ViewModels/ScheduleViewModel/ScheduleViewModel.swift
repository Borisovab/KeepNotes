//
//  ScheduleViewModel.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import Foundation
import CoreData

class ScheduleViewModel {
    var name: String = ""
    var index: IndexPath?
    var constant: Constant?

    struct Constant {
        static let entity = "Note"
        static let sortName = "noteHeader"
        static let cellName = "scheduleTableViewCellReuseIdentifier"
    }

    var fetchResultController: NSFetchedResultsController<NSFetchRequestResult> = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constant.entity)

        // добвление сортировки по имени
        let sortDescription = NSSortDescriptor(key: Constant.sortName, ascending: true)
        fetchRequest.sortDescriptors = [sortDescription]

        // создаем контроллер
        let fetchedResultController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: CoreDataManager.instance.context,
            sectionNameKeyPath: nil,
            cacheName: nil)

        return fetchedResultController
    }()

    // выборка данных из БД
    func fetchedResult() {
        do {
            try fetchResultController.performFetch()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
