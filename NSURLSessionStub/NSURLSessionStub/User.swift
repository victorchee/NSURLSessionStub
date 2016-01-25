//
//  User.swift
//  NSURLSessionStub
//
//  Created by qihaijun on 1/25/16.
//  Copyright © 2016 VictorChee. All rights reserved.
//

import Foundation

struct User: Equatable {
    let name: String
    let id: Int
}

func ==(lhs: User, rhs: User) -> Bool {
    guard lhs.name == rhs.name else {
        return false
    }
    guard lhs.id == rhs.id else {
        return false
    }
    return true
}