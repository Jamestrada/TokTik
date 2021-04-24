//
//  ProfileHeaderCollectionReusableView.swift
//  TokTik
//
//  Created by James Estrada on 4/23/21.
//

import UIKit

protocol ProfileHeaderCollectionReusableViewDelegate: AnyObject {
    func ProfileHeaderCollectionReusableView(_ header: ProfileHeaderCollectionReusableView, didTapPrimaryButtonWith viewModel: ProfileHeaderViewModel)
    func ProfileHeaderCollectionReusableView(_ header: ProfileHeaderCollectionReusableView, didTapFollowersButtonWith viewModel: ProfileHeaderViewModel)
    func ProfileHeaderCollectionReusableView(_ header: ProfileHeaderCollectionReusableView, didTapFollowingButtonWith viewModel: ProfileHeaderViewModel)
}

class ProfileHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileHeaderCollectionReusableView"
    
    weak var delegate: ProfileHeaderCollectionReusableViewDelegate?
    
    var viewModel: ProfileHeaderViewModel?
    
    // Subviews
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .secondarySystemBackground
        return imageView
    }()
    
    // Follow or Edit Profile
    private let primaryButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.layer.masksToBounds = true
        button.setTitle("Follow", for: .normal)
        button.backgroundColor = .systemPink
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        return button
    }()
    
    private let followersButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.layer.masksToBounds = true
        button.setTitle("0\nFollowers", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 2
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let followingButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.layer.masksToBounds = true
        button.setTitle("0\nFollowing", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 2
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        backgroundColor = .systemBackground
        addSubviews()
        configureButtons()
    }
    
    func addSubviews() {
        addSubview(avatarImageView)
        addSubview(primaryButton)
        addSubview(followersButton)
        addSubview(followingButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configureButtons() {
        primaryButton.addTarget(self, action: #selector(didTapPrimaryButton), for: .touchUpInside)
        followersButton.addTarget(self, action: #selector(didTapFollowersButton), for: .touchUpInside)
        followingButton.addTarget(self, action: #selector(didTapFollowingButton), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let avatarSize: CGFloat = 130
        avatarImageView.frame = CGRect(x: (width - avatarSize) / 2, y: 5, width: avatarSize, height: avatarSize)
        avatarImageView.layer.cornerRadius = avatarImageView.height / 2
        
        followersButton.frame = CGRect(x: (width - 210) / 2, y: avatarImageView.bottom + 10, width: 100, height: 60)
        followingButton.frame = CGRect(x: followersButton.right + 10, y: avatarImageView.bottom + 10, width: 100, height: 60)
        
        primaryButton.frame = CGRect(x: (width - 220) / 2, y: followingButton.bottom + 15, width: 220, height: 44)
    }
    
    // Actions
    
    @objc func didTapPrimaryButton() {
        guard let viewModel = self.viewModel else {
            return
        }
        delegate?.ProfileHeaderCollectionReusableView(self, didTapPrimaryButtonWith: viewModel)
    }
    
    @objc func didTapFollowersButton() {
        guard let viewModel = self.viewModel else {
            return
        }
        delegate?.ProfileHeaderCollectionReusableView(self, didTapFollowersButtonWith: viewModel)
    }
    
    @objc func didTapFollowingButton() {
        guard let viewModel = self.viewModel else {
            return
        }
        delegate?.ProfileHeaderCollectionReusableView(self, didTapFollowingButtonWith: viewModel)
    }
    
    func configure(with viewModel: ProfileHeaderViewModel) {
        self.viewModel = viewModel
        // Set up header
    }
}
