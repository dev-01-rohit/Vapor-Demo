//
//  File.swift
//  HelloVapor
//
//  Created by ROHIT MISHRA on 21/09/25.
//

import Vapor

struct MovieController: RouteCollection {
    func boot(routes: any Vapor.RoutesBuilder) throws {
        let movies = routes.grouped("movies")
        
        movies.get(use: handleUser)
        
        movies.get(":movieId", use: handleId)
    }
    
    // MARK: - Route handler
    func handleUser(req: Request) async -> String {
        return "Movie"
    }
    
    func handleId(req: Request) async throws -> String {
        guard let id = req.parameters.get("movieId") else {
            throw Abort(.internalServerError)
        }
        return "\(id)"
    }
}
