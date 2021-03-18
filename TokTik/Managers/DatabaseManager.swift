//
//  DatabaseManager.swift
//  TokTik
//
//  Created by James Estrada on 3/14/21.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    public static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    private init() {  //shared has to be used
        
    }
    
    // Public
    
    public func getAllUsers(completion: ([String]) -> Void) {
        
    }
}
