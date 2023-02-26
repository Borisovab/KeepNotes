//
//  ScheduleVC+setFetchResult.swift
//  KeepNotes
//
//  Created by Александр Борисов on 26.02.2023.
//

import Foundation

extension ScheduleViewController {
    func setFetchResult() {
        viewModel?.fetchResultController.delegate = self
        viewModel?.fetchedResult()
    }
}
