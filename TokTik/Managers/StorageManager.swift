//
//  StorageManager.swift
//  TokTik
//
//  Created by James Estrada on 3/14/21.
//

import Foundation
import FirebaseStorage

final class StorageManager {
    public static let shared = StorageManager()
    
    private let database = Storage.storage().reference()
    
    private init() {  //shared has to be used
        
    }
    
    // Public
    
    public func getVideoURL(with identifier: String, completion: (URL) -> Void) {
        
    }
    
    public func uploadVideoURL(from url: URL) {
        
    }
}
