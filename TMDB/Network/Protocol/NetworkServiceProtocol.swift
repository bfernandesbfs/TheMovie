//
//  NetworkServiceProtocol.swift
//  TMDB
//
//  Created by Bruno Fernandes on 26/02/20.
//  Copyright © 2020 BFS. All rights reserved.
//

import Combine

public protocol NetworkServiceProtocol {

    @discardableResult
    func load<T: Decodable>(_ router: NetworkRouterProtocol) -> AnyPublisher<Result<T, NetworkError>, Never>
}
