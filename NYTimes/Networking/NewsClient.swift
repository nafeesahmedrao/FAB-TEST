//
//  NewsClient.swift
//  NYTimes
//
//  Created by Mubeena K A on 25/11/2019.
//  Copyright © 2019 Nafees. All rights reserved.
//

import Foundation

class NewsClient: APIClient {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    // in the signature of the function in the success case we define the Class type thats is the generic one in the API
    func getFeed(from movieFeedType: NewsFeed, completion: @escaping (Result<NewsFeedResult?, APIError>) -> Void) {
        
        let endpoint = movieFeedType
        let request = endpoint.request
        
        fetch(with: request, decode: { json -> NewsFeedResult? in
            guard let movieFeedResult = json as? NewsFeedResult else { return nil }
            return movieFeedResult
        }, completion: completion)
    }
}
