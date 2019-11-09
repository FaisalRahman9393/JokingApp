//
//  JokesEndpoints.swift
//  JokingFramework
//
//  Created by Faisal Rahman on 09/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

struct JokesEndpoints {
    let RANDOM_JOKE_ENDPOINT = "http://api.icndb.com/jokes/random"
    let JOKE_WITH_NAME_ENDPOINT = "http://api.icndb.com/jokes/random?firstName=%@&amp;lastName=%@"
    let RANDOM_JOKE_WITH_AMOUNT_ENDPOINT = "http://api.icndb.com/jokes/random/%@"
    let JOKE_CATEGORIES_ENDPOINT = "http://api.icndb.com/categories"
}
