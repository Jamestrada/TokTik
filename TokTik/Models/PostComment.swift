//
//  PostComment.swift
//  TokTik
//
//  Created by James Estrada on 3/25/21.
//

import Foundation

struct PostComment {
    let text: String
    let user: User
    let date: Date
    
    static func mockComments() -> [PostComment] {
        let user = User(username: "kanyewest", profilePictureURL: nil, identifier: UUID().uuidString)
        var comments = [PostComment]()
        let text = [
            "This is cool",
            "This is rad",
            "Check out my new album"
        ]
        for comment in text {
            comments.append(
                PostComment(text: comment, user: user, date: Date())
            )
        }
        return comments
    }
}
