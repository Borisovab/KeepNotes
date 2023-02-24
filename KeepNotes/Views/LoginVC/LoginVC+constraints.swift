//
//  LoginVC+constraints.swift
//  KeepNotes
//
//  Created by Александр Борисов on 24.02.2023.
//

import Foundation
import SnapKit

extension LoginViewController {
    func setupConstraints() {
        [loginScreen, logsStackView, enterButton].forEach{ view.addSubview( $0) }

        loginScreen.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(80)
        }

        logsStackView.snp.makeConstraints { make in
            make.top.equalTo(loginScreen.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(80)
        }

        enterButton.snp.makeConstraints { make in
            make.top.equalTo(logsStackView.snp.bottom).offset(70)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(80)
        }
    }

}
