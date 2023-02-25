//
//  ScheduleVC+constraints.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import Foundation
import SnapKit

extension ScheduleViewController {
    func setupConstraints() {
        [scheduleTableView].forEach{ view.addSubview( $0) }

        scheduleTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(92)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-50)
        }
    }
}
