//
//  SingleJokeResponse.swift
//  JokingFramework
//
//  Created by Faisal Rahman on 09/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import Foundation

struct SingleJokeResponse: Decodable {
    let type: String
    let value: SingleJokeValue
}

struct SingleJokeValue: Decodable {
    let id: Int
    let joke: String
    let categories: [String]
}
