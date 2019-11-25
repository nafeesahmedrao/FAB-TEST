//
//  NewsFeedResult.swift
//  NYTimes
//
//  Created by Mubeena K A on 25/11/2019.
//  Copyright © 2019 Nafees. All rights reserved.
//

import Foundation

struct NewsFeedResult: Decodable {
    let results: [News]?
}
