//
//  TableViewCell.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import UIKit
import SnapKit

class ScheduleTableViewCell: UITableViewCell {

    var noteNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    override func prepareForReuse() {
        super.prepareForReuse()
        noteNameLabel.text = nil
    }

    private func setupConstraints() {
        [noteNameLabel].forEach{ contentView.addSubview($0) }

        noteNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.trailing.equalToSuperview().inset(5)
            make.bottom.equalToSuperview().offset(-5)
        }
    }

    func configureScheduleCell(noteName: String) {
        setupConstraints()

        self.noteNameLabel.text = noteName
    }

}
