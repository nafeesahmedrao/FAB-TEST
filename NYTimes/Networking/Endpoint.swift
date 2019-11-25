//
//  Endpoint.swift
//  NYTimes
//
//  Created by Mubeena K A on 25/11/2019.
//  Copyright © 2019 Nafees. All rights reserved.
//

import Foundation

protocol Endpoint {
    
    var base: String { get }
    var path: String { get }
}

extension Endpoint {
    
    var apiKey: String {
        return "api-key=3Zk5vXeyYbRLeeWSHFRlFaEIRqDAp9Yy"
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.query = apiKey
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

enum NewsFeed {
    case topRated
}

extension NewsFeed: Endpoint {
    
    var base: String {
        return "https://api.nytimes.com"
    }
    
    var path: String {
        switch self {
        case .topRated: return "/svc/mostpopular/v2/mostviewed/all-sections/7.json"
        }
    }
}

