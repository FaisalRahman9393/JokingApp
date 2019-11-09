//
//  NetworkClient.swift
//  JokingFramework
//
//  Created by Faisal Rahman on 09/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

class NetworkClient: NetworkClientPort {
    func perform(_ request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { responseData, response, responseError in
            DispatchQueue.main.async {
                completionHandler(responseData, response, responseError)
            }
        }
        
        task.resume()
    }
}
