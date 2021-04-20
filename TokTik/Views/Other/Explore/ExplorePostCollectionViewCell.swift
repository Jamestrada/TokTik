//
//  ExplorePostCollectionViewCell.swift
//  TokTik
//
//  Created by James Estrada on 4/3/21.
//

import UIKit

class ExplorePostCollectionViewCell: UICollectionViewCell {
    static let identifier = "ExplorePostCollectionViewCell"
    
    private let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill // fill image and keep aspect ratio
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0 // unlimited number of lines
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.addSubview(thumbnailImageView)
        contentView.addSubview(captionLabel)
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true // for corner radius to take effect
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let captionHeight = contentView.height / 5
        thumbnailImageView.frame = CGRect(x: 0, y: 0, width: contentView.width, height: contentView.height - captionHeight)
        captionLabel.frame = CGRect(x: 0, y: contentView.height - captionHeight, width: contentView.width, height: captionHeight)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
        captionLabel.text = nil
    }
    
    func configure(with viewModel: ExplorePostViewModel) {
        captionLabel.text = viewModel.caption
        thumbnailImageView.image = viewModel.thumbnailImage
    }
}
