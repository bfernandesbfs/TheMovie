//
//  Constants.swift
//  TMDB
//
//  Created by Bruno Fernandes on 26/02/20.
//  Copyright © 2020 BFS. All rights reserved.
//

import Foundation

internal enum Constants {

    enum Api: CustomStringConvertible {
        case key, baseUrl

        var description: String {
            switch self {
            case .key:
                return "181af7fcab50e40fabe2d10cc8b90e37"
            case .baseUrl:
                return "https://api.themoviedb.org/3"
            }
        }
    }

    enum Images: CustomStringConvertible {
        case originalUrl, smallUrl

        var description: String {
            switch self {
            case .originalUrl:
                return "https://image.tmdb.org/t/p/original"
            case .smallUrl:
                return "https://image.tmdb.org/t/p/w154"
            }
        }
    }

}
