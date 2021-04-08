//
//  AuthenticationManager.swift
//  TokTik
//
//  Created by James Estrada on 3/14/21.
//

import Foundation
import FirebaseAuth

final class AuthManager {
    public static let shared = AuthManager()
    
    private init() {  //shared has to be used
        
    }
    
    enum SignInMethod {
        case email
        case facebook
        case google
    }
    
    // Public
    
    public func signIn(with method: SignInMethod) {
        
    }
    
    public func signOut() {
        
    }
}
