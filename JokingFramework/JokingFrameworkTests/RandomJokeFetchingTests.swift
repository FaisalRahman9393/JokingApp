//
//  JokingFrameworkTests.swift
//  JokingFrameworkTests
//
//  Created by Faisal Rahman on 09/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import XCTest
@testable import JokingFramework

class RandomJokeFetchingTests: XCTestCase {
    
    var networkClient: ResponseMappingNetworkClient!
    var endpoints: JokesEndpoints!
    let validRandomJokeJSON = """
        {
        "type": "success",
        "value": [
        {
          "id": 242,
          "joke": "Everybody loves Raymond. Except Chuck Norris.",
          "categories": []
        },
        {
          "id": 380,
          "joke": "Chuck Norris does not follow fashion trends, they follow him. But then he turns around and kicks their ass. Nobody follows Chuck Norris.",
          "categories": []
        },
        {
          "id": 490,
          "joke": "Chuck Norris doesn't need to use AJAX because pages are too afraid to postback anyways.",
          "categories": [
            "nerdy"
          ]
        },
        {
          "id": 137,
          "joke": "Tom Clancy has to pay royalties to Chuck Norris because &quot;The Sum of All Fears&quot; is the name of Chuck Norris' autobiography.",
          "categories": []
        },
        {
          "id": 366,
          "joke": "If Chuck Norris wants your opinion, he'll beat it into you.",
          "categories": []
        },
        {
          "id": 411,
          "joke": "The pen is mightier than the sword, but only if the pen is held by Chuck Norris.",
          "categories": []
        },
        {
          "id": 282,
          "joke": "Chuck Norris can skeletize a cow in two minutes.",
          "categories": []
        },
        {
          "id": 618,
          "joke": "Chuck Norris puts sunglasses on to protect the sun from his eyes.",
          "categories": []
        },
        {
          "id": 438,
          "joke": "Chuck Norris likes his ice like he likes his skulls: crushed.",
          "categories": []
        },
        {
          "id": 429,
          "joke": "Chuck Norris has never been accused of murder because his roundhouse kicks are recognized as &quot;acts of God.&quot;",
          "categories": []
        }
        ]
        }
        """
    
    override func setUp() {
        networkClient = ResponseMappingNetworkClient()
        endpoints = JokesEndpoints()
    }

    
//    let validRandomJoke

    func testwhenARandomJokeIsRequested_callIsMadeToTheJokesAPI() {
        //given the jokesToolkit is initialised with a mockNetworkClient
        let jokesToolkit = JokesToolkit()
        jokesToolkit.initialise(networkClient: networkClient)
        networkClient.mapResponsePayload(responseData: validRandomJokeJSON.data(using: .utf8)!, for: endpoints.RANDOM_JOKE_ENDPOINT)
        
        //when a random joke is requested
        let jokeRetrived: String = jokesToolkit.fetchRandomJoke()
        
        //then a request is made to the ICNDB
        guard let request = networkClient.capturedRequest(for: endpoints.RANDOM_JOKE_ENDPOINT) else {
            XCTFail()
            return
        }
        XCTAssertTrue((request.url?.absoluteString.starts(with: endpoints.RANDOM_JOKE_ENDPOINT))!)
        
    }

}


