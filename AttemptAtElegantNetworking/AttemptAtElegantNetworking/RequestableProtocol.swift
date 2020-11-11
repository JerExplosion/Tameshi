//
//  RequestableProtocol.swift
//  AttemptAtElegantNetworking
//
//  Created by Jerry Ren on 11/10/20.
//

import Foundation

protocol RequestabilityProtocol {
    func urlRequestFunc() -> URLRequest
}

struct URequest: RequestabilityProtocol {
    
    let path: String?
    let method: String?
    
    init(method: String = GloballyApplied.getMethod, path: String) {
        self.method = method
        self.path = path
    }
    
    func urlRequestFunc() -> URLRequest {

        guard let url = URL(string: GloballyApplied.baseURLString) else {
            let emptyURL = URL(fileURLWithPath: GloballyApplied.nothingness)
            let emptyRequest = URLRequest(url: emptyURL)
            return emptyRequest
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        return request
    }
}

//  _____________________________________ //

extension URLRequest: RequestabilityProtocol {
    func urlRequestFunc() -> URLRequest {
        return self
    } // not sure if this extension is necessary or not though
}
