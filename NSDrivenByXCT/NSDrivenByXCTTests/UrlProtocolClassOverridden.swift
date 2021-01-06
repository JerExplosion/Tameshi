//
//  UrlProtocolClassOverridden.swift
//  NSDrivenByXCTTests
//
//  Created by Jerry Ren on 1/6/21.
//

import Foundation

class UrlMockedProtocolClass: URLProtocol {
    
    static var stubResponseData: Data?
    
    override class func canInit(with request: URLRequest) -> Bool {
         return true
    }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func stopLoading() { }
    //required to override, but body can be empty
    
    override func startLoading() {
        self.client?.urlProtocol(self, didLoad: UrlMockedProtocolClass.stubResponseData ?? Data())
        self.client?.urlProtocolDidFinishLoading(self)
    }
}
       
