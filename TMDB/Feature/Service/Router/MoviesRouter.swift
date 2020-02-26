//
//  MoviesRouter.swift
//  TMDB
//
//  Created by Bruno Fernandes on 26/02/20.
//  Copyright © 2020 BFS. All rights reserved.
//

import Foundation

public enum MoviesRouter: NetworkRouterProtocol {

    case movies(query: String)
    case details(movieId: Int)

    public var path: String {
        switch self {
        case .movies:
            return "/search/movie"
        case .details(let movieId):
            return "/movie/\(movieId)"
        }
    }

    public var parameters: [String: CustomStringConvertible] {
        switch self {
        case .movies(let query):
            return [
                "api_key": Constants.Api.key.description,
                "query": query,
                "language": Locale.preferredLanguages[0]
            ]
        case .details:
            return [
                "api_key": Constants.Api.key.description,
                "language": Locale.preferredLanguages[0]
            ]
        }
    }

    public var resource: Resource {

        guard let baseUrl = URL(string: Constants.Api.baseUrl.description) else {
            fatalError("Can't possible parse baseurl string to URL")
        }

        let url = baseUrl.appendingPathComponent(self.path)
        return Resource(url: url, parameters: self.parameters)
    }
}

