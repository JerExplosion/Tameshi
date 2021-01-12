//
//  UrlProtocolClassOverridden.swift
//  NSDrivenByXCTTests
//
//  Created by Jerry Ren on 1/6/21.
//

import Foundation

class UrlSimulatedProtocolClass: URLProtocol {
    static var stubbedResponseData: Data?
    static var erro: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
         return true
    }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    override func stopLoading() { }

    override func startLoading() {
        if let erro = UrlSimulatedProtocolClass.erro { [self]
            client?.urlProtocol(self, didFailWithError: erro)
        } else {
            client?.urlProtocol(self, didLoad: UrlSimulatedProtocolClass.stubbedResponseData ?? Data.init())
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }
}
       
