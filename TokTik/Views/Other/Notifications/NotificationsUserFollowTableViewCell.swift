//
//  NotificationsUserFollowTableViewCell.swift
//  TokTik
//
//  Created by James Estrada on 4/19/21.
//

import UIKit

class NotificationsUserFollowTableViewCell: UITableViewCell {
    static let identifier = "NotificationsUserFollowTableViewCell"
    
    // avatar, label, follow button
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .label
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follow", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 6
        button.layer.masksToBounds = true
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(avatarImageView)
        contentView.addSubview(label)
        contentView.addSubview(dateLabel)
        contentView.addSubview(followButton)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let iconSize: CGFloat = 50
        avatarImageView.frame = CGRect(x: 10, y: 3, width: iconSize, height: iconSize)
        avatarImageView.layer.cornerRadius = 25
        avatarImageView.layer.masksToBounds = true
        
        followButton.sizeToFit()
        followButton.frame = CGRect(x: contentView.width - 110, y: 15, width: 90, height: 30)
        
        let labelSize = label.sizeThatFits(CGSize(width: contentView.width - 30 - followButton.width - iconSize, height: contentView.height - 40))
        label.sizeToFit()
        label.frame = CGRect(x: avatarImageView.right + 10, y: 3, width: labelSize.width, height: labelSize.height)
        
        dateLabel.sizeToFit()
        dateLabel.frame = CGRect(x: avatarImageView.right + 10, y: label.bottom + 3, width: contentView.width - avatarImageView.width - followButton.width, height: 40)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil
        label.text = nil
        dateLabel.text = nil
    }
    
    func configure(with username: String, model: Notification) {
        avatarImageView.image = UIImage(named: "test")
        label.text = model.text
        dateLabel.text = .date(with: model.date)
    }
}