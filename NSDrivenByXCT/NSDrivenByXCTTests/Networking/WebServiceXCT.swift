//
//  WebServiceXCT.swift
//  NSDrivenByXCTTests
//
//  Created by Jerry Ren on 1/2/21.
//

import XCTest
@testable import NSDrivenByXCT

class WebServiceXCT: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testingWSwithSuccessfulResponse() throws {
        
        // Arrange
        let eConfig = URLSessionConfiguration.ephemeral
        eConfig.protocolClasses = [UrlMockedProtocolClass.self]
        let urlSessionObj = URLSession(configuration: eConfig)
        
        let jsonStr = "{\"status\":\"ok\"}"
        UrlMockedProtocolClass.stubResponseData = jsonStr.data(using: .utf8)

        let sut = SupWebService.init(urlString: GloballyApplicable.sUpUrlstring, mockUrlSession: urlSessionObj)

        let sUpRequestModel = SUpRequestModel(first: "Sergey", last: "Kargopolov", email: "test@test.com", passcode: "12345678")
        
        let expectation = self.expectation(description: "sUp web service expectation")
         
        // Act
        sut.sUp(with: sUpRequestModel) { (responseModel, error) in
            // Assert
            XCTAssertEqual(responseModel?.status, "ok") // or "oK"
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }

}





//      let sUpRequestModel = SUpRequestModel(first: "O", last: "S", email: "os.os", passcode: "os")
