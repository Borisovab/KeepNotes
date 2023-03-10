//
//  NoteVC+constraints.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import Foundation
import SnapKit

extension NoteViewController {
    func setupConstraints() {
        [fontStackView, noteHeaderTF, noteTextView, seveButton].forEach{ view.addSubview( $0) }

        fontStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.leading.trailing.equalToSuperview().inset(25)
//            make.width.equalTo(150)
            make.height.equalTo(40)
        }

        noteHeaderTF.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(180)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(40)
        }

        noteTextView.snp.makeConstraints { make in
            make.top.equalTo(noteHeaderTF.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(450)
        }

        seveButton.snp.makeConstraints { make in
            make.top.equalTo(noteTextView.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(60)
        }

        
    }

}
