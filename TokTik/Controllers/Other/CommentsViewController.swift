//
//  CommentsViewController.swift
//  TokTik
//
//  Created by James Estrada on 3/23/21.
//

import UIKit

class CommentsViewController: UIViewController {
    private let post: PostModel
    
    init(post: PostModel) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        fetchPostComments()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func fetchPostComments() {
        
    }
}
