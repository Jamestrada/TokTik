//
//  ExploreUserViewModel.swift
//  TokTik
//
//  Created by James Estrada on 3/31/21.
//

import Foundation
import UIKit

struct ExploreUserViewModel {
    let profilePicture: UIImage?
    let username: String
    let followerCount: Int
    let handler: (() -> Void)
}

