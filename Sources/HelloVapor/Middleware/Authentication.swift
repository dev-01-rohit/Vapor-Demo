//
//  File.swift
//  HelloVapor
//
//  Created by ROHIT MISHRA on 11/10/25.
//

import Vapor

struct Authentication: AsyncMiddleware {
    func respond(to request: Vapor.Request, chainingTo next: any Vapor.AsyncResponder) async throws -> Vapor.Response {
        // Getting header token
        guard let token = request.headers.bearerAuthorization?.token else {
            throw Abort(.unauthorized)
        }
        print("token \(token)")
        return try await next.respond(to: request)
    }
    
}
