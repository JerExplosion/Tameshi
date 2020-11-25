//
//  DecodableStructs.swift
//  AsyncMockExpectation
//
//  Created by Jerry Ren on 11/24/20.
//

import Foundation
 
struct TrackObject: Codable, Equatable {
    let trackName: String?
    let artist: String?
}

struct SearchResultResponse: Codable {
    let results: [TrackObject]
}



    
