//
//  JSONStubs.swift
//  JokingFrameworkTests
//
//  Created by Faisal Rahman on 09/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import Foundation

internal struct JSONStubValues {
    let validRandomJokeJSON = """
        {
        "type": "success",
        "value": {
        "id": 133,
        "joke": "Example Joke",
        "categories": ""
        }
        }
        """
    
    let missingKeysRandomJokeJSON = """
        {
        "type": "success",
        "value": {
        "id": 133,
        "categories": ""
        }
        }
        """
    
    let invalidRandomJokeJSON = """
        {,,,,
        "typdddddries": ""
        }
        }xsxxeed
        """
}
