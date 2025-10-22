//
//  File.swift
//  HelloVapor
//
//  Created by ROHIT MISHRA on 11/10/25.
//

import Vapor

struct LoggingMiddleware: AsyncMiddleware {
    func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        print("Log Middleware")
        return try await next.respond(to: request)
    }
}
