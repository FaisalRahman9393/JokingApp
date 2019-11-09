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
              "value": [
                {
                  "id": 507,
                  "joke": "Example Joke",
                  "categories": [
                    "nerdy"
                  ]
                }
              ]
            }
        """
    
    let missingKeysRandomJokeJSON = """
            {
              "type": "success",
              "value": [
                {
                  "id": 507,
                  "categories": [
                    "nerdy"
                  ]
                }
              ]
            }
        """
    
    let invalidRandomJokeJSON = """
        {,,,,
        "typdddddries": ""
        }
        }xsxxeed
        """
    
    let validBatchJokesJSON = """
    {
        "type": "success",
        "value": [
        {
        "id": 563,
        "joke": "Random Joke 1",
        "categories": [
        "nerdy"
        ]
        },
        {
        "id": 2,
        "joke": "Random Joke 2",
        "categories": []
        },
        {
        "id": 3,
        "joke": "Random Joke 3",
        "categories": []
        },
        {
        "id": 56,
        "joke": "Random Joke 4",
        "categories": []
        },
        {
        "id": 116,
        "joke": "Random Joke 5",
        "categories": []
        }
        ]
    }
"""
    
    let batchJokesJSONWithMissingKeys = """
    {
        "type": "success",
        "value": [
        {
        "id": 563,
        "categories": [
        "nerdy"
        ]
        },
        {
        "id": 2,
        "joke": "Random Joke 2",
        "categories": []
        }
        ]
    }
"""
    
    let invalidBatchJokesJSONs = """
    {
        "type": "success",
        "value": [
        {
        "id": 563,
        "categories": [
        "nerd,,,,,,,,,,,,,,,,,,,
        "joke": "Random Joke 2",
        "categories": []
        }
        ]
    }
"""
}
