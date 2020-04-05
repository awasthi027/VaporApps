//
//  LoginResponse.swift
//  App
//
//  Created by Ashish Awasthi on 04/04/20.
//

import Vapor

struct APIResponse: Content {
    var message: String
    var statusCode: Int
}

extension APIResponse {
    init(with meesage: String = "", statusCode: Int = 200) {
        self.message = meesage
        self.statusCode = statusCode
    }
}
