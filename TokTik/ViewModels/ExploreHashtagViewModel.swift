//
//  ExploreHashtagViewModel.swift
//  TokTik
//
//  Created by James Estrada on 3/31/21.
//

import Foundation
import UIKit

struct ExploreHashtagViewModel {
    let text: String
    let icon: UIImage?
    let count: Int // Number of posts associated with tag
    let handler: (() -> Void)
}
