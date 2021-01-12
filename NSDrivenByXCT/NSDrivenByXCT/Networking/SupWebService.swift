//
//  SupWebService.swift
//  NSDrivenByXCT
//
//  Created by Jerry Ren on 1/2/21.
//

import Foundation

class SupWebService {
    
    private var mockUrlSession: URLSession
    private var urlString: String
    
    init(urlString: String, mockUrlSession: URLSession = .shared) {
        self.urlString = urlString
        self.mockUrlSession = mockUrlSession
    }
    
    func sUp(with requestModel: SUpRequestModel, completionHandler: @escaping (SUpResponseModel?, SUpErrors?) -> Void) {
        guard let urlObj = URL(string: urlString) else {
            completionHandler(nil ,SUpErrors.invalidUrlStrErro)
            return
        }
        var request = URLRequest(url: urlObj)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(requestModel)
        
        let dTask = mockUrlSession.dataTask(with: request) { (data, response, erro) in
            if let data = data, let sUpResponseModel = try? JSONDecoder().decode(SUpResponseModel.self, from: data) {
                completionHandler(sUpResponseModel, nil)
            } else {
                completionHandler(nil, SUpErrors.parsingErro)
            }
        }
        dTask.resume()
    }
}
