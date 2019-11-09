//
//  JokeResponse.swift
//  JokingFramework
//
//  Created by Faisal Rahman on 09/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import Foundation

struct BatchJokeResponse: Decodable {
    let type: String
    let value: [JokeValue]
}

struct JokeValue: Decodable {
    let id: Int
    let joke: String
    let categories: [String]
}




