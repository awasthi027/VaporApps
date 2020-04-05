//
//  UserInfo.swift
//  App
//
//  Created by Ashish Awasthi on 29/03/20.
//

import Vapor
import FluentSQLite

public final class User: SQLiteModel {
    public var id: Int?
    var firstName: String
    var lastName: String
    var email: String
    var contact: String
    var city: String
    var state: String
    /// Creates a new `Todo`.
    init(id: Int? = nil, firstName: String = "", lastName: String = "", email: String = "",
         contact: String = "", city: String = "", state: String = "") {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.contact = contact
        self.city = city
        self.state = state
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension User: Migration {
    
}

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension User: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension User: Parameter { }

