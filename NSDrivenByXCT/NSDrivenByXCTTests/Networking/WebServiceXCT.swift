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
        ephConfig.protocolClasses = [UrlSimulatedProtocolClass.self]
        let urlSessionObj = URLSession(configuration: ephConfig)
        
        sut = SupWebService.init(urlString: GloballyApplicable.sUpUrlstring, mockUrlSession: urlSessionObj)
        sUpRequestModel = SUpRequestModel(first: "Sergey", last: "Kargopolov", email: "test@test.com", passcode: "12345678")
    }
    
    override func tearDownWithError() throws {
        sut = nil
        sUpRequestModel = nil
        UrlSimulatedProtocolClass.stubbedResponseData = nil
    }
    
    func testingWSwithSuccessfulResponse() throws {
        let jsonStr = "{\"status\":\"oKks666比\"}"
        UrlSimulatedProtocolClass.stubbedResponseData = jsonStr.data(using: .utf8)
        
        let expectation = self.expectation(description: "expectation for a plain vanilla successful response")
        
        guard let sUpRequestModel = sUpRequestModel else { throw SUpErrors.requestModelErro }
        sut?.sUp(with: sUpRequestModel) { (responseModel, error) in
            
            XCTAssertEqual(responseModel?.status, "oKks666比")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    
    func testingWwithAbnormalResponse() {
        
        let diffJsonStr = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        UrlSimulatedProtocolClass.stubbedResponseData = diffJsonStr.data(using: .utf8)
        
        let expectation = self.expectation(description: "expectation for an abnormal Json structure")
        
        guard let sUpRequestModel = sUpRequestModel else { return }
        sut?.sUp(with: sUpRequestModel) { (responseModel, erro) in
            XCTAssertNil(responseModel, "the response model should be nil in this scenario")
            XCTAssertEqual(erro, SUpErrors.parsingErro, "the expected erro is not returned")
            XCTAssertEqual(SUpErrors.invalidUrlStrErro, SUpErrors.invalidUrlStrErro)
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5.2)
    }
    
    func testingWwithEmptyUrlString() throws {
        
        let expectation = self.expectation(description: "expectation for an empty url string")
        sut = SupWebService(urlString: "") // or ""
        guard let sUpRequestModel = sUpRequestModel else { throw SUpErrors.requestModelErro }
        sut?.sUp(with: sUpRequestModel, completionHandler: { responseModel, erro in
            XCTAssertEqual(SUpErrors.invalidUrlStrErro, erro, "erro different than expected")
            XCTAssertNil(responseModel, "the response model should be nil in this scenario too")
            expectation.fulfill()
        })
        self.wait(for: [expectation], timeout: 3)
    }
    
    
    func testingWwithFailedUrlRequest() {
//    let expectation = self.expectation(description: "expectation for a failed request")
        let expectation = XCTestExpectation(description: "expectation for a failed request")
        
        let erroDepiction = "localized depiction of the erro"
        UrlSimulatedProtocolClass.erro = SUpErrors.failedRequestErro(erroDescription: erroDepiction)
        
        if let sUpRequestModel = sUpRequestModel {
            sut?.sUp(with: sUpRequestModel, completionHandler: { (responseModel, erro) in
                XCTAssertEqual(SUpErrors.failedRequestErro(erroDescription: erroDepiction), erro)
                expectation.fulfill()
            })
        }
        self.wait(for: [expectation], timeout: 3.4)
    }
}
   
//   let erroDepiction = "The operation couldn’t be completed. (NSDrivenByXCT.SUpErrors error 0.)"  (shortcut hh)
//      let sUpRequestModel = SUpRequestModel(first: "O", last: "S", email: "os.os", passcode: "os")
             

