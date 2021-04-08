//
//  SignInViewController.swift
//  TokTik
//
//  Created by James Estrada on 3/14/21.
//

import UIKit

class SignInViewController: UIViewController {
    public var completion: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Sign In"
    }
}
