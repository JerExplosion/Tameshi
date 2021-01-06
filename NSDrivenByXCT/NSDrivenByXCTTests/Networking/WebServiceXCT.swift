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
        let sut = SupWebService.init(urlString: "http://appsdeveloperblog.com:8080/signup-mock-service/users")
        
//        let newSut = SupWebService.init(urlString: <#T##String#>, mockUrlSession: <#T##URLSession#>)
        
        let sUpRequestModel = SUpRequestModel(first: "O", last: "S", email: "os.os", passcode: "os")
        let expectation = self.expectation(description: "sUp web service expectation")
        // Act
        sut.sUp(with: sUpRequestModel) { (responseModel, error) in
            // Assert
            XCTAssertEqual(responseModel?.status, "ok") // or "oK"
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5.3)
    }

}
