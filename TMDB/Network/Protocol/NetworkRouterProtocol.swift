//
//  NetworkRouterProtocol..swift
//  TMDB
//
//  Created by Bruno Fernandes on 26/02/20.
//  Copyright © 2020 BFS. All rights reserved.
//

import Foundation

public protocol NetworkRouterProtocol {

    var path: String { get }

    var parameters: [String: CustomStringConvertible] { get }

    var resource: Resource { get }
}
