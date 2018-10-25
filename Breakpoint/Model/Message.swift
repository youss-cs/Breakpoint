//
//  Message.swift
//  Breakpoint
//
//  Created by YouSS on 10/25/18.
//  Copyright © 2018 YouSS. All rights reserved.
//

import Foundation

class Message {
    
    private var _content: String!
    private var _senderId: String!
    
    var content: String {
        return _content
    }
    
    var senderId: String {
        return _senderId
    }
    
    init(content: String, senderId: String) {
        _content = content
        _senderId = senderId
    }
}
