//
//  Musicality.swift
//  AsyncMockExpectation
//
//  Created by Jerry Ren on 11/24/20.
//

import Foundation
          
extension URLRequest {
    static func searching(with searchTerm: String) -> URLRequest {
        var components = URLComponents(string: GloballyApplied.itunesURL)
        
        components?.queryItems = [
            .init(name: "media", value: "music"),
            .init(name: "entity", value: "song"),
            .init(name: "term", value: "\(searchTerm)")
        ]
        
        return URLRequest.init(url: (components?.url)!) //fix the force unwrap later
    }
}
 
                  
             
