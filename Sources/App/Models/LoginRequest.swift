//
//  LoginRequest.swift
//  App
//
//  Created by Ashish Awasthi on 01/04/20.
//

import Vapor

struct LoginRequest: Content {
    var email: String
    var password: String
}

extension LoginRequest {
    var isValidUser: Bool {
        if self.email == "myemail.awasthi@gmail.com" && self.password == "test#123" {
            return true
        }
        return false
    }
}


