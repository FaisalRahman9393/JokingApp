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
    
    var jokesToolkit : JokesToolkit!
    var networkClient: ResponseMappingNetworkClient!
    var endpoints: JokesEndpoints!
    var jsonStubs: JSONStubs!
    
    
    override func setUp() {
        jokesToolkit = JokesToolkit()
        networkClient = ResponseMappingNetworkClient()
        endpoints = JokesEndpoints()
        jsonStubs = JSONStubs()
    }

    func testwhenARandomJokeIsRequested_aCallIsMadeToTheJokesAPI() {
        givenTheJokesToolkitIsInitialisedWithANetworkClient()
        
        whenARandomJokeIsRequested()
        
        thenARequestIsMadeToTheICNDB()
    }
    

    
    func testwhenARandomJokeResponseIsValid_aRandomJokeIsReturned() {
        givenTheJokesToolkitIsInitialisedWithANetworkClient()
        andTheNetworkClientIsMappedWithAValidResponse()
        
        
        let expectation = self.expectation(description: "fetchingJoke")
        var jokeFetched: Joke?
        
        jokesToolkit.fetchRandomJoke(success: { joke in
            jokeFetched = joke
            
            expectation.fulfill()
        }) { (_) in
            
        }
        
        waitForExpectations(timeout: 0.2, handler: nil)
        XCTAssertEqual(jokeFetched?.joke, "Example Joke")
        
   
        
        
    }
}

// MARK: Helper functions

extension RandomJokeFetchingTests {
    
    // MARK: Given
    func givenTheJokesToolkitIsInitialisedWithANetworkClient() {
        jokesToolkit.initialise(networkClient: networkClient)
    }
    
    fileprivate func andTheNetworkClientIsMappedWithAValidResponse() {
        networkClient.mapResponsePayload(responseData: jsonStubs.validRandomJokeJSON.data(using: .utf8)!, for: endpoints.RANDOM_JOKE_ENDPOINT)
    }
    
    // MARK: When
    
    func whenARandomJokeIsRequested() {
        jokesToolkit.fetchRandomJoke(success: { _ in

        }) { _ in
            
        }
    }

    // MARK: Then

    func thenARequestIsMadeToTheICNDB() {
        guard let request = networkClient.capturedRequest(for: endpoints.RANDOM_JOKE_ENDPOINT) else {
            XCTFail()
            return
        }
        
        XCTAssertTrue((request.url?.absoluteString.starts(with: endpoints.RANDOM_JOKE_ENDPOINT))!)
    }
}
