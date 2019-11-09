//
//  CustomJokeFetchingTests.swift
//  JokingFrameworkTests
//
//  Created by Faisal Rahman on 09/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import XCTest
@testable import JokingFramework

class CustomJokeFetchingTests: XCTestCase {

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
    
    func testWhenFetchCustomJokeIsCalled_thenACallIsMadeToTheCustomJokesEndpoint() {
        //given
        givenTheJokesToolkitIsInitialisedWithANetworkClient()
        
        //when
        whenACustomJokeWithChuckNorrisIsRequested()
        
        //then
        thenARequestIsMadeToTheICNDBWithChuckNorris()
    }
    
    func testWhenACustomJokeResponse_IsValid_aCustomJokeIsReturned() {
        let expectation = self.expectation(description: "fetchingJoke")
        var jokeFetched: Joke?
        
        //given
        givenTheJokesToolkitIsInitialisedWithANetworkClient()
        andTheNetworkClientIsMappedWithAValidResponse()
        
        //when
        jokesToolkit.fetchCustomJoke(firstName: "Chuck", lastName: "Norris", success: { joke in
            jokeFetched = joke
            expectation.fulfill()
        }) { (_) in
            
        }
        
        //then
        waitForExpectations(timeout: 0.2, handler: nil)
        XCTAssertEqual(jokeFetched?.joke, "Example Joke")
        
    }
    
    func testWhenACustomJokeResponse_HasInvalidJSON_thenFailureIsReported() {
        let expectation = self.expectation(description: "fetchingFailure")
        var failureMessage: String?
        var failureReason: JokeFetchinngFailureReason?
        
        //given
        givenTheJokesToolkitIsInitialisedWithANetworkClient()
        andTheNetworkClientIsMappedWithAnInvalidJSONResponse()
        
        //when
        jokesToolkit.fetchCustomJoke(firstName: "Chuck", lastName: "Norris", success: { joke in
        }) { (failure) in
            failureMessage = failure.message
            failureReason = failure.reason
            expectation.fulfill()
            
        }
        
        //then
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(failureMessage, "Missing Keys or Invalid Json")
        XCTAssertEqual(failureReason, JokeFetchinngFailureReason.MissingKeysOrInvalidJson)
        
    }
    
    func testWhenARandomJokeResponse_HasMissingKeys_thenFailureIsReported() {
        let expectation = self.expectation(description: "fetchingFailure")
        var failureMessage: String?
        var failureReason: JokeFetchinngFailureReason?
        
        //given
        givenTheJokesToolkitIsInitialisedWithANetworkClient()
        andTheNetworkClientIsMappedWithAMissingKeysResponse()
        
        
        //when
        jokesToolkit.fetchCustomJoke(firstName: "Chuck", lastName: "Norris", success: { joke in
        }) { (failure) in
            failureMessage = failure.message
            failureReason = failure.reason
            expectation.fulfill()
        }
        
        //then
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(failureMessage, "Missing Keys or Invalid Json")
        XCTAssertEqual(failureReason, JokeFetchinngFailureReason.MissingKeysOrInvalidJson)
        
    }
}

// MARK: Helper functions

extension CustomJokeFetchingTests {
    
    // MARK: Given
    func givenTheJokesToolkitIsInitialisedWithANetworkClient() {
        jokesToolkit.initialise(networkClient: networkClient)
    }
    
    fileprivate func andTheNetworkClientIsMappedWithAValidResponse() {
        networkClient.mapResponsePayload(responseData: jsonStubs.validRandomJokeJSON.data(using: .utf8)!, for: getCustomURL(firstName: "Chuck", lastName: "Norris"))
    }
    
    fileprivate func andTheNetworkClientIsMappedWithAMissingKeysResponse() {
        networkClient.mapResponsePayload(responseData: jsonStubs.missingKeysRandomJokeJSON.data(using: .utf8)!, for:getCustomURL(firstName: "Chuck", lastName: "Norris"))
    }
    
    fileprivate func andTheNetworkClientIsMappedWithAnInvalidJSONResponse() {
        networkClient.mapResponsePayload(responseData: jsonStubs.invalidRandomJokeJSON.data(using: .utf8)!, for: getCustomURL(firstName: "Chuck", lastName: "Norris"))
    }
    
    // MARK: When
    
    func whenACustomJokeWithChuckNorrisIsRequested() {
        jokesToolkit.fetchCustomJoke(firstName: "Chuck", lastName: "Norris", success: { (_) in
        }) { (_) in
            
        }
    }
    
    func whenFiveRandomJokesAreRequested() {
        jokesToolkit.batchFetchRandomJokes(numberOfJokes: 5, success: { (_) in
            
        }) { (_) in
            
        }
    }
    
    // MARK: Then
    
    
    func thenARequestIsMadeToTheICNDBWithChuckNorris() {
        guard let request = networkClient.capturedRequest(for: getCustomURL(firstName: "Chuck", lastName: "Norris")) else {
            XCTFail()
            return
        }
    
        XCTAssertTrue((request.url?.absoluteString.starts(with: getCustomURL(firstName: "Chuck", lastName: "Norris")))!)
    }
    
    // MARK: Other
    
    func getCustomURL(firstName: String, lastName: String) -> String{
        return String(format: endpoints.JOKE_WITH_NAME_ENDPOINT, "Chuck", "Norris")
    }

    
}
