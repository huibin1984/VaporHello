//
//  HelloController.swift
//  App
//
//  Created by 吴辉斌 on 2018/6/13.
//

import Vapor
import Crypto

final class HelloController {
    func greet(_ req: Request) throws -> String {
//        return "Hello!"
        return try req.make(BCryptDigest.self).hash("Hello!")
    }
    
    func users(_ req: Request) throws -> String {
        let id = try req.parameters.next(Int.self)
        return "requested id #\(id)"
    }
    
    func login(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.content.decode(LoginRequest.self).map(to: HTTPStatus.self) { loginRequest in
            print(loginRequest.email)
            print(loginRequest.password)
            return .ok
        }
    }
    
    func getUser(_ req: Request) throws -> User {
        return User(name: "Join", email: "join@huibin.com")
    }
}

struct LoginRequest: Content {
    var email: String
    var password: String
}

struct User: Content {
    var name: String
    var email: String
}
