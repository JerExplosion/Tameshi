//
//  UrlProtocolClassOverridden.swift
//  NSDrivenByXCTTests
//
//  Created by Jerry Ren on 1/6/21.
//

import Foundation

class UrlMockedProtocolClass: URLProtocol {
    static var stubbedResponseData: Data?
    
    override class func canInit(with request: URLRequest) -> Bool {
         return true
    }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    override func stopLoading() { }

    override func startLoading() {
        self.client?.urlProtocol(self, didLoad: UrlMockedProtocolClass.stubbedResponseData ?? Data())
        self.client?.urlProtocolDidFinishLoading(self)
    }
}
       
