//
//  ExploreCell.swift
//  TokTik
//
//  Created by James Estrada on 3/31/21.
//

import Foundation
import UIKit

// Hold all the different type of cells and the associated view model to configure each of those cells
enum ExploreCell {
    case banner(viewModel: ExploreBannerViewModel)
    case post(viewModel: ExplorePostViewModel)
    case hashtag(viewModel: ExploreHashtagViewModel)
    case user(viewModel: ExploreUserViewModel)
}
