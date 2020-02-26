//
//  NetworkError.swift
//  TMDB
//
//  Created by Bruno Fernandes on 26/02/20.
//  Copyright © 2020 BFS. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    case invalidRequest
    case invalidResponse
    case dataLoadingError(statusCode: Int, data: Data)
    case jsonDecodingError(error: Error)
}
