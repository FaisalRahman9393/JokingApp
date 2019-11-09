//
//  ResponseMappingNetworkClient.swift
//  JokingFrameworkTests
//
//  Created by Faisal Rahman on 09/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

@testable import JokingFramework

class ResponseError: Error {}

class ResponseMappingNetworkClient: NetworkClientPort {
    
    private var failureErrors: [String : Error] = Dictionary()
    private var responsePayloads: [String : Data] = Dictionary()
    private var responses: [String: URLResponse] = Dictionary()
    private var capturedRequests: [String : URLRequest] = Dictionary()
    
    
    class SuccessBuilder {
        private let client: ResponseMappingNetworkClient
        
        init() {
            client = ResponseMappingNetworkClient()
        }
    }
    
    class FailureBuilder {
        
        func build() -> ResponseMappingNetworkClient {
            return ResponseMappingNetworkClient()
        }
        
    }
    
    struct URLTask {
        let request: URLRequest
        let completionHandler: (Data?, URLResponse?, Error?) -> Void
    }


    

    
    func perform(_ request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        if let urlString = request.url?.absoluteString {
            capturedRequests[urlString] = request
            performRequest(request, completionHandler)
        }
    }
    
    private func performRequest(_ request: URLRequest, _ completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let mappedErrorItem = failureErrors.first { key, value -> Bool in
            request.url?.absoluteString.starts(with: key) ?? false
        }
        if let mappedError = mappedErrorItem?.value {
            completionHandler(nil, nil, mappedError)
            return
        }
        
        let responsePayloadMappedItem = responsePayloads.first { key, value -> Bool in
            request.url?.absoluteString.starts(with: key) ?? false
        }
        
        guard let responsePayload = responsePayloadMappedItem?.value else {
            completionHandler(nil, nil, ResponseError())
            return
        }
        
        let responseMappedItem = responses.first { key, value -> Bool in
            request.url?.absoluteString.starts(with: key) ?? false
        }
        
        completionHandler(responsePayload, responseMappedItem?.value, nil)
    }

    
    func mapError(error: Error, for endpoint: String) {
        failureErrors[endpoint] = error
    }
    
    func mapResponsePayload(responseData: Data, for endpoint: String) {
        responsePayloads[endpoint] = responseData
    }
    
    func mapResponse(response: URLResponse, for endpoint: String) {
        responses[endpoint] = response
    }
    
    func capturedRequest(for url: String) -> URLRequest? {
        return capturedRequests.first(where: { key, value -> Bool in
            key.starts(with: url)
        })?.value
    }
    
    func clearCapturedRequests() {
        capturedRequests = Dictionary()
    }
    
}
