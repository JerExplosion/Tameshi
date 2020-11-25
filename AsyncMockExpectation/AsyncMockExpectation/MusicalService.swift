//
//  MusicalService.swift
//  AsyncMockExpectation
//
//  Created by Jerry Ren on 11/24/20.
//

import Foundation

protocol HTTPClientProtocol {
    func execution(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void)
}

struct MusicalService {
    
    let httpClient: HTTPClientProtocol
    
    func searchThroughMusics(_ searchTerm: String, completion: @escaping (Result<[TrackObject], Error>) -> Void) {
        httpClient.execution(request: .searching(with: searchTerm)) { result in
            self.parser(result)
        }
    }
    
    private func parser(_ result: Result<Data, Error>) -> Result<[TrackObject], Error> {
        return result as! Result<[TrackObject], Error>    // force cast for now, fix later
    }
}

   
// MARK: - previous way without HTTPClientProtocol

    //    func searchThroughMusics(_ searchTerm: String, completion: @escaping (Result<[TrackObject], Error>) -> Void) {
    //        URLSession.shared.dataTask(with: .searching(with: searchTerm)) { data, response, erro in
    //            DispatchQueue.main.async {
    //                completion(self.parser(data: data, erro: erro))
    //            }
    //        }
    //        .resume()
    //    }
    
//    func parser(data: Data?, erro: Error?) -> Result<[TrackObject], Error> {
//        if let data = data {
//            return Result {
//                try JSONDecoder().decode(SearchResultResponse.self, from: data).results } }
//        else {
//            return .failure(erro ?? URLError(.badServerResponse))
//        }
//    }

      
