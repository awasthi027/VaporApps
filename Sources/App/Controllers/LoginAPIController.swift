//
//  LoginAPIController.swift
//  App
//
//  Created by Ashish Awasthi on 04/04/20.
//

import Vapor

final class LoginAPIController: RouteCollection {
    
    func boot(router: Router) throws {
        router.post("user/login/status", use: login)
        router.post("user/login/response", use: loginResponse)
    }
    
    private func login(req: Request) throws ->Future<HTTPStatus>  {
        return try req.content.decode(LoginRequest.self).map(to: HTTPStatus.self) { loginRequest in
            if loginRequest.isValidUser {
                return .ok
            }
            print(loginRequest.email) // user@vapor.codes
            print(loginRequest.password) // don't look!
            return .noContent
        }
    }
    
    private func loginResponse(req: Request) throws ->Future<APIResponse>  {
        return try req.content.decode(LoginRequest.self).map(to: APIResponse.self) { loginRequest in
            if loginRequest.isValidUser {
                return APIResponse.init(with: "User login has been successfully", statusCode: 200)
            }
            print(loginRequest.email) // user@vapor.codes
            print(loginRequest.password) // don't look!
            return APIResponse.init(with: "User login has been failed", statusCode: 404)
        }
    }
}
