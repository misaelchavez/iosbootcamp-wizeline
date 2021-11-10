//
//  MovieFeed.swift
//  TheMovieDb
//
//  Created by Misael Chávez on 31/10/21.
//

import Foundation

enum MovieFeed: Int {
    case trending = 0
    case nowPlaying
    case popular
    case topRated
    case upcoming
    case keyword
    case search
    case reviews
    case similar
    case recommendations
    case configuration
}

extension MovieFeed: EndPoint {
    var base: String {
        return Constants.apiBaseURL
    }
    
    var defaultParams: [String: String] {
        [
            "language": "en",
            "region": "US",
            "api_key": Constants.apiKey
        ]
    }
    
    func getPath(searchId: String?) -> String {
        switch self {
        case .trending:
            return "/3/trending/movie/day"
        case .nowPlaying:
            return "/3/movie/now_playing"
        case .topRated:
            return "/3/movie/top_rated"
        case .keyword:
            return "/3/search/keyword"
        case .search:
            return "/3/search/movie"
        case .reviews:
            return "/3/movie/\(searchId ?? "")/reviews"
        case .similar:
            return "/3/movie/\(searchId ?? "")/similar"
        case .recommendations:
            return "/3/movie/\(searchId ?? "")/recommendations"
        case .configuration:
            return "/3/configuration"
        default:
            return "/3/movie/\(self)"
        }
    }
}

extension MovieFeed {
    func getNavigationTitle() -> String {
        switch self {
        case .trending:
            return "Trending"
        case .nowPlaying:
            return "Now Playing"
        case .popular:
            return "Popular"
        case .topRated:
            return "Top Rated"
        case .upcoming:
            return "Upcoming"
        default:
            return ""
        }
    }
}