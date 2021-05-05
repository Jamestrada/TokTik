//
//  SwitchCellViewModel.swift
//  TokTik
//
//  Created by James Estrada on 5/2/21.
//

import Foundation

struct SwitchCellViewModel {
    let title: String
    var isOn: Bool

    mutating func setOn(_ on: Bool) {
        self.isOn = on
    }
}
