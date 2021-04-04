//
//  ExploreUserCollectionViewCell.swift
//  TokTik
//
//  Created by James Estrada on 4/3/21.
//

import UIKit

class ExploreUserCollectionViewCell: UICollectionViewCell {
    static let identifier = "ExploreUserCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with viewModel: ExploreUserViewModel) {
        
    }
}
