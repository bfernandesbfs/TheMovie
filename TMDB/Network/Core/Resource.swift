//
//  Resource.swift
//  TMDB
//
//  Created by Bruno Fernandes on 26/02/20.
//  Copyright © 2020 BFS. All rights reserved.
//

import Foundation

public struct Resource {

    private let url: URL
    private let parameters: [String: CustomStringConvertible]

    public var request: URLRequest? {
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return nil
        }
        components.queryItems = parameters.keys.map { key in
            URLQueryItem(name: key, value: parameters[key]?.description)
        }
        guard let url = components.url else {
            return nil
        }
        return URLRequest(url: url)
    }

    public init(url: URL, parameters: [String: CustomStringConvertible] = [:]) {
        self.url = url
        self.parameters = parameters
    }

}
