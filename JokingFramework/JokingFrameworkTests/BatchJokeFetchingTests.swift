//
//  RandomJokeFetchingTests.swift
//  JokingFrameworkTests
//
//  Created by Faisal Rahman on 09/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import XCTest
@testable import JokingFramework

class BatchJokeFetchingTests: XCTestCase {
    
    var jokesToolkit : JokesToolkit!
    var networkClient: ResponseMappingNetworkClient!
    var endpoints: JokesEndpoints!
    var jsonStubs: JSONStubValues!
    
    
    override func setUp() {
        jokesToolkit = JokesToolkit()
        networkClient = ResponseMappingNetworkClient()
        endpoints = JokesEndpoints()
        jsonStubs = JSONStubValues()
    }
    
    func testwhenBatchFetchRandomJokesIsCalled_thenACallIsMadeToTheBatchJokesEndpoint() {
        givenTheJokesToolkitIsInitialisedWithANetworkClient()
            
        whenTenRandomJokesAreRequested()
            
        thenARequestIsMadeToTheICNDBWithTenJokes()
    }
    
    func testwhenBatchFetchRandomJokesIsCalled_thenMultipleJokesAreRetrived() {
        givenTheJokesToolkitIsInitialisedWithANetworkClient()
        andTheNetworkClientIsMappedWithAValidResponse()
        
        jokesToolkit.batchFetchRandomJokes(numberOfJokes: 5, success: { (jokes) in
            
        }) { (_) in
            
        }
        
        let expectation = self.expectation(description: "fetchingJoke")
        var jokesFetched = [Joke]()
        
        jokesToolkit.batchFetchRandomJokes(numberOfJokes: 5, success: { jokes in
            jokesFetched = jokes
            expectation.fulfill()
        }) { (_) in
            
        }
        
        waitForExpectations(timeout: 0.2, handler: nil)
        XCTAssertEqual(jokesFetched[0].joke, "Random Joke 1")
        XCTAssertEqual(jokesFetched[1].joke, "Random Joke 2")
        XCTAssertEqual(jokesFetched[2].joke, "Random Joke 3")
        XCTAssertEqual(jokesFetched[3].joke, "Random Joke 4")
        XCTAssertEqual(jokesFetched[4].joke, "Random Joke 5")
        
        
    }
}

    


// MARK: Helper functions

extension BatchJokeFetchingTests {
    
    // MARK: Given
    func givenTheJokesToolkitIsInitialisedWithANetworkClient() {
        jokesToolkit.initialise(networkClient: networkClient)
    }
    
    fileprivate func andTheNetworkClientIsMappedWithAValidResponse() {
        networkClient.mapResponsePayload(responseData: jsonStubs.validBatchJokesJSON.data(using: .utf8)!, for: endpoints.RANDOM_JOKE_ENDPOINT)
    }
    
    fileprivate func andTheNetworkClientIsMappedWithAMissingKeysResponse() {
        networkClient.mapResponsePayload(responseData: jsonStubs.missingKeysRandomJokeJSON.data(using: .utf8)!, for: endpoints.RANDOM_JOKE_ENDPOINT)
    }
    
    fileprivate func andTheNetworkClientIsMappedWithAnInvalidJSONResponse() {
        networkClient.mapResponsePayload(responseData: jsonStubs.invalidRandomJokeJSON.data(using: .utf8)!, for: endpoints.RANDOM_JOKE_ENDPOINT)
    }
    
    // MARK: When
    
    func whenTenRandomJokesAreRequested() {
        jokesToolkit.batchFetchRandomJokes(numberOfJokes: 10, success: { (_) in
            
        }) { (_) in
            
        }
    }
    
    func whenFiveRandomJokesAreRequested() {
        jokesToolkit.batchFetchRandomJokes(numberOfJokes: 5, success: { (_) in
            
        }) { (_) in
            
        }
    }
    
    // MARK: Then
    
    func thenARequestIsMadeToTheICNDBWithTenJokes() {
        let endpoint = String(format: endpoints.BATCH_RANDOM_JOKES_ENDPOINT, "10")
        guard let request = networkClient.capturedRequest(for: endpoint) else {
            XCTFail()
            return
        }
        
        XCTAssertTrue((request.url?.absoluteString.starts(with: endpoints.RANDOM_JOKE_ENDPOINT))!)
    }
}
