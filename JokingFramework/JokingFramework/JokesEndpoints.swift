//
//  JokesEndpoints.swift
//  JokingFramework
//
//  Created by Faisal Rahman on 09/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

struct JokesEndpoints {
    let RANDOM_JOKE_ENDPOINT = "https://api.icndb.com/jokes/random"
    let JOKE_WITH_NAME_ENDPOINT = "https://api.icndb.com/jokes/random?firstName=%@&lastName=%@"
    let BATCH_RANDOM_JOKES_ENDPOINT = "https://api.icndb.com/jokes/random/%@"
    let JOKE_CATEGORIES_ENDPOINT = "https://api.icndb.com/categories"
}
