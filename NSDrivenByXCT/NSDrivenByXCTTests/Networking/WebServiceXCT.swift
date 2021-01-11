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
        let jsonStr = "{\"status\":\"oKks666比\"}"
        UrlMockedProtocolClass.stubbedResponseData = jsonStr.data(using: .utf8)
        
        let expectation = self.expectation(description: "expectation for a plain vanilla successful response")
        
        guard let sUpRequestModel = sUpRequestModel else { throw SUpErrors.requestModelErro }
        sut?.sUp(with: sUpRequestModel) { (responseModel, error) in
            
            XCTAssertEqual(responseModel?.status, "oKks666比")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
      
private func testingWwithAbnormalResponse() {
    
        let diffJsonStr = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        UrlMockedProtocolClass.stubbedResponseData = diffJsonStr.data(using: .utf8)
        
        let expectation = self.expectation(description: "expectation for an abnormal Json structure returned")
        
        guard let sUpRequestModel = sUpRequestModel else { return }
        sut?.sUp(with: sUpRequestModel) { (responseModel, erro) in
            XCTAssertNil(responseModel, "the response model should be nil in this scenario")
            XCTAssertEqual(erro, SUpErrors.parsingErro, "the expected erro is not returned")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5.2)
    }
}


//      let sUpRequestModel = SUpRequestModel(first: "O", last: "S", email: "os.os", passcode: "os")
