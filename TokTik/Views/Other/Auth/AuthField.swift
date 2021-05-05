//
//  AuthField.swift
//  TokTik
//
//  Created by James Estrada on 4/8/21.
//

import UIKit

class AuthField: UITextField {

    enum FieldType {
        case username
        case email
        case password

        var title: String {
            switch self {
            case .username:
                return "Username"
            case .email:
                return "Email Address"
            case .password:
                return "Password"
            }
        }
    }

    private let type: FieldType

    init(type: FieldType) {
        self.type = type
        super.init(frame: .zero)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func configureUI() {
        autocapitalizationType = .none
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 8
        layer.masksToBounds = true
        placeholder = type.title
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: height))
        leftViewMode = .always
        returnKeyType = .done
        autocorrectionType = .no

        if type == .password {
            textContentType = .oneTimeCode // will not try to autofill any password
            isSecureTextEntry = true
        } else if type == .email {
            textContentType = .emailAddress // show emails that have been used to sign in
            keyboardType = .emailAddress
        }
    }
}
