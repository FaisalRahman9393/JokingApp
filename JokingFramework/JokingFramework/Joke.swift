//
//  Joke.swift
//  JokingFramework
//
//  Created by Faisal Rahman on 09/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

struct Joke {
    var jokeID: Int
    var joke: String
    var jokeCategory: [String]
    init(jokeID: Int, joke: String, jokeCategory: [String]) {
        self.jokeID = jokeID
        self.joke = joke
        self.jokeCategory = jokeCategory
    }
}
