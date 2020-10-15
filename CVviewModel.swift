//
//  CustomViewViewModel.swift
//  CustomViewMVVM
//
//  Created by Jerry Ren on 10/14/20.
//  Copyright © 2020 N/A. All rights reserved.
//

import Foundation

class CVviewModel {
    
    var closureUponCompletion: (() ->())?
    var apiDealer = APIDealer.init()
    var response: URLResponse?
    var erro: Error?
    var jsonObjctCollection: [JsonObject]?
    
    func gettingDataForVM(stringURL: String) {
        apiDealer.pullingData(stringURL: stringURL)
        
        apiDealer.normalClosure = {
            (data, response, erro) in
            print("response's mime type is \(response?.mimeType)")
            
            guard let data = data else {
                print(NetworkErros.dataEmpty.localizedDescription)
                return
            }
            do {
                self.jsonObjctCollection = try JSONDecoder().decode([JsonObject].self, from: data)
                print(self.jsonObjctCollection?[0].title)
            } catch {
                print(erro.debugDescription)
                print("good catch")
            }
            self.response = response
            self.erro = erro
            self.closureUponCompletion?()
        }
        return
    }
}
