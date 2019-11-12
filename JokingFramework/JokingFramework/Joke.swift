//
//  Joke.swift
//  JokingFramework
//
//  Created by Faisal Rahman on 09/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

public struct Joke {
    public var jokeID: Int
    public var joke: String
    public var jokeCategory: [String]
    init(jokeID: Int, joke: String, jokeCategory: [String]) {
        self.jokeID = jokeID
        self.joke = joke
        self.jokeCategory = jokeCategory
    }
}
