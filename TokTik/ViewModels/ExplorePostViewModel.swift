//
//  ExplorePostViewModel.swift
//  TokTik
//
//  Created by James Estrada on 3/31/21.
//

import Foundation
import UIKit

struct ExplorePostViewModel {
    let thumbnailImage: UIImage?
    let caption: String
    let handler: (() -> Void)
}
