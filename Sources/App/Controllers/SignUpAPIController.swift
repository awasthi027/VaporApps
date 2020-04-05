//
//  SignUpAPIController.swift
//  App
//
//  Created by Ashish Awasthi on 04/04/20.
//

import Vapor
import Fluent

final class SignUpAPIController: RouteCollection {
    func boot(router: Router) throws {
        router.get("user/userinfo", use: index)
        router.post("user/signup", use: create)
        router.post("user/delete", Int.parameter, use: delete)
        router.get("user/userinfo", Int.parameter, use: findUser)
    }
    /// Returns a list of all `User`s.
    func index(_ req: Request) throws -> Future<[User]> {
        return User.query(on: req).all()
    }
    
    /// Saves a decoded `User` to the database.
    func create(_ req: Request) throws -> Future<User> {
        return try req.content.decode(User.self).flatMap { user in
         User.query(on: req).filter(\.email == user.email).first().flatMap(to: User.self) { item in
          guard let post = item else {
             return user.save(on: req)
          }
         throw Abort(.badRequest, reason: "This user already existing database, emailId is: \(post.email). Please try with deferent email id.")
        }
      }
    }
    
    /// Deletes a parameterized `User`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        let userId  = try req.parameters.next(Int.self)
        print("Deleted userid: \(userId)")
        return User.find(userId, on: req).flatMap { user in
            guard let post = user else {
                throw Abort(.notFound)
            }
            return post.delete(on: req).map {
                return .ok
            }
        }
    }
    
    func findUser(_ req: Request) throws -> Future<User> {
        let userId  = try req.parameters.next(Int.self)
        return User.find(userId, on: req).map(to: User.self) { user in
            guard let post = user else {
                throw Abort(.notFound, reason: "We haven't found any user for to this userid:- \(userId)")
            }
            return post
        }
    }
    
}
