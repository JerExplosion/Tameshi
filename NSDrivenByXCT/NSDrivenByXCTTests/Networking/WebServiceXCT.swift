//
//  WebServiceXCT.swift
//  NSDrivenByXCTTests
//
//  Created by Jerry Ren on 1/2/21.
//

import XCTest
@testable import NSDrivenByXCT

class WebServiceXCT: XCTestCase {
    
    var sUpRequestModel: SUpRequestModel? 
    var sut: SupWebService?

    override func setUpWithError() throws {
        let ephConfig = URLSessionConfiguration.ephemeral
        ephConfig.protocolClasses = [UrlMockedProtocolClass.self]
        let urlSessionObj = URLSession(configuration: ephConfig)
        
        sut = SupWebService.init(urlString: GloballyApplicable.sUpUrlstring, mockUrlSession: urlSessionObj)
        sUpRequestModel = SUpRequestModel(first: "Sergey", last: "Kargopolov", email: "test@test.com", passcode: "12345678")
    }

    override func tearDownWithError() throws {
        sut = nil
        sUpRequestModel = nil
        UrlMockedProtocolClass.stubbedResponseData = nil
    }

    func testingWSwithSuccessfulResponse() throws {
        
        let jsonStr = "{\"status\":\"ok\"}"
 //       UrlMockedProtocolClass.stubbedResponseData = jsonStr.data(using: .utf8)

        let expectation = self.expectation(description: "sUp web service expectation")
         
        guard let sUpRequestModel = sUpRequestModel else { throw SUpErrors.requestModelErro }
        sut?.sUp(with: sUpRequestModel) { (responseModel, error) in
            // Assert
            XCTAssertEqual(responseModel?.status, "ok") // or "oK"
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
}


//      let sUpRequestModel = SUpRequestModel(first: "O", last: "S", email: "os.os", passcode: "os")
