//
//  RealClientvsMockClient.swift
//  AsyncMockExpectation
//
//  Created by Jerry Ren on 11/24/20.
//

import Foundation
   
class HTTPRealClient: HTTPClientProtocol {
    func execution(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        
        URLSession.shared.dataTask(with: request) { (data, response, erro) in
            DispatchQueue.main.async {
                if let data = data {
                    completion(.success(data))
                }
                else {
                    guard let erro = erro else { return }
                    completion(.failure(erro))
                }
            }
        } .resume()
    }
}

// MARK: - MockObject below

class HTTPMockClient: HTTPClientProtocol {
    
    var inputRequest: URLRequest?
    var executionCalled: Bool = false
    var result: Result<Data, Error>?
    
    func execution(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        self.executionCalled = true
        self.inputRequest = request
        result.map(completion)
    }
}




