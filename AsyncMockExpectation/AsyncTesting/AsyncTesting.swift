//
//  AsyncTesting.swift
//  AsyncTesting
//
//  Created by Jerry Ren on 11/24/20.
//

import XCTest
@testable import AsyncMockExpectation

class AsyncTesting: XCTestCase {

    override func setUpWithError() throws {
        
    }
    override func tearDownWithError() throws {
        
    }
    
    func testingSearchWithSuccessfulResponse() throws {
        let expectedTrackCollections = [TrackObject(trackName: "Q", artist: "R")]
        let responseData = try JSONEncoder().encode(SearchResultResponse(results: expectedTrackCollections))
        
        let mockHttpClient = HTTPMockClient.init()
        mockHttpClient.result = .success(responseData)
        
        let sut = MusicalService(httpClient: mockHttpClient)
        var result: Result<[TrackObject], Error>?
         
        sut.searchThroughMusics("Q", completion: { result = $0 })
        
    // XCTAssertEqual(<#T##expression1: Equatable##Equatable#>, expectedTrackCollections)
    }

    func testingSearch() {
        let mockHttpClient = HTTPMockClient.init()
        let sut = MusicalService(httpClient: mockHttpClient)
//        sut.searchThroughMusics("M") {  _ in }
        sut.searchThroughMusics("M", completion: { _ in })
        
        XCTAssertTrue(mockHttpClient.executionCalled)
        XCTAssertEqual(mockHttpClient.inputRequest, .searching(with: "M"))
    }
    
    

}
