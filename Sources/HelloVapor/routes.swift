import Vapor

func routes(_ app: Application) throws {
    // MARK: - Sending a json model
//    app.get("movies") { req async -> [Movie] in
//        return [
//            .init(name: "Batman", year: 2002),
//            .init(name: "superman",  year: 2013),
//            .init(name: "super Girl", year: 2023)
//        ]
//    }
//    
//    // MARK: - Handle Queries
//    // - /hotels?sort=desc&search=Delhi
//    app.get("hotels") { req async in
//        do {
//            let hotel = try req.query.decode(Hotel.self)
//            return hotel
//        } catch {
//            return .init(sort: "", search: "", error: error.localizedDescription)
//        }
//    }
//    
//    // MARK: - Posting json to the server
//    app.post("movies") { req async throws in
//        let movie = try req.content.decode(Movie.self)
//        return movie
//    }
//    
//    /**
//     * Dynamic route
//     * movie/action
//     * movie/horror
//     * movie/comdy
//     */
//    app.get("movies", ":genre") { req async -> String in
//        let genre = req.parameters.get("genre")
//        return "\(genre)"
//    }
//    
//    // movie/{genre}/{year}
//    app.get("movies", ":genre", ":year") { req async throws -> String in
//        guard let genre = req.parameters.get("genre"),
//              let year = req.parameters.get("year") else {
//            throw  Abort(.badRequest)
//        }
//        
//        return "Movie \(genre) \(year)"
//    }
//    
//    app.get("cutomers", ":customerId") { req async throws -> String in
//        guard let customerId = req.parameters.get("customerId", as: Int.self) else {
//            throw Abort(.badRequest)
//        }
//        
//        return "Customer Id = \(customerId)"
//    }
//    
//    // MARK: - Grouped
//    // /movies
//    // movies/123..
//    
//    let movies = app.grouped("movies")
//    movies.get { req async in
//        return "movie"
//    }
//    
//    movies.get(":movieId") { req async throws in
//        guard let movieId = req.parameters.get("movieId", as: String.self) else {
//            throw Abort(.badRequest)
//        }
//        
//        return "Movie id: \(movieId)"
//    }
//    
//    // MARK: - User Route
//    let user = app.grouped("users")
//    
//    user.get("premium") { req async throws in
//        return "Premium"
//    }
    
    app.middleware.use(LoggingMiddleware())
    
    app.grouped(Authentication()).group("members") { route in
        route.get { req async -> String in
            return "Member index"
        }
        
        route.get("hello") { req async -> String in
            return "Hello member"
        }
    }
    
    // MARK: - Handle route with controller
    try app.register(collection: MovieController())
    
    app.middleware.use(Authentication())
    
}
