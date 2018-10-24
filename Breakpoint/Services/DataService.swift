//
//  DataService.swift
//  Breakpoint
//
//  Created by YouSS on 10/23/18.
//  Copyright © 2018 YouSS. All rights reserved.
//

import Foundation
import Firebase

let _DB_BASE = Database.database().reference()

class DataService {
    static let instance = DataService()
    
    private var _REF_BASE = _DB_BASE
    private var _DB_USERS = _DB_BASE.child("users")
    private var _DB_GROUPS = _DB_BASE.child("groups")
    private var _DB_FEED = _DB_BASE.child("feed")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _DB_USERS
    }
    
    var REF_GROUPS: DatabaseReference {
        return _DB_GROUPS
    }
    
    var REF_FEED: DatabaseReference {
        return _DB_FEED
    }
    
    func createDBUser(uid: String, userData: Dictionary<String,Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func uploadPost(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, sendComplete: @escaping (_ status: Bool) -> ()) {
        if groupKey != nil {
            // send to groups ref
        } else {
            REF_FEED.childByAutoId().updateChildValues(["content": message, "senderId": uid])
            sendComplete(true)
        }
    }
}
