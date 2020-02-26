//
//  NetworkService.swift
//  TMDB
//
//  Created by Bruno Fernandes on 26/02/20.
//  Copyright © 2020 BFS. All rights reserved.
//

import Combine
import Foundation

public final class NetworkService {

    private let session: URLSession

    public init(session: URLSession = URLSession(configuration: URLSessionConfiguration.ephemeral)) {
        self.session = session
    }

    @discardableResult
    public func load<T: Decodable>(_ router: NetworkRouterProtocol) -> AnyPublisher<Result<T, NetworkError>, Never> {

        guard let request = router.resource.request else {
            return .just(.failure(NetworkError.invalidRequest))
        }

        return session.dataTaskPublisher(for: request)
            .mapError { _ in NetworkError.invalidRequest }
            .print()
            .flatMap { data, response -> AnyPublisher<Data, Error> in
                guard let response = response as? HTTPURLResponse else {
                    return .fail(NetworkError.invalidResponse)
                }

                guard 200..<300 ~= response.statusCode else {
                    return .fail(NetworkError.dataLoadingError(statusCode: response.statusCode, data: data))
                }
                return .just(data)
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .map {
                .success($0)
            }
            .catch { error -> AnyPublisher<Result<T, NetworkError>, Never> in
                .just(.failure(NetworkError.jsonDecodingError(error: error)))
            }
            .eraseToAnyPublisher()
    }

}
