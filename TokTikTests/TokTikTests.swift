//
//  TokTikTests.swift
//  TokTikTests
//
//  Created by James Estrada on 5/6/21.
//

import XCTest

@testable import TokTik

class TokTikTests: XCTestCase {
    func testPostModelChildPath() {
        let id = UUID().uuidString
        let user = User(username: "nomad.james", profilePictureURL: nil, identifier: "123")
        var post = PostModel(identifier: id, user: user)
        
        XCTAssertTrue(post.caption.isEmpty)
        post.caption = "Hello!"
        XCTAssertFalse(post.caption.isEmpty)
        XCTAssertEqual(post.caption, "Hello!")
        XCTAssertEqual(post.videoChildPath, "videos/nomad.james/")
    }
}
