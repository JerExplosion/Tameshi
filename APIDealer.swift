//
//  APIDealer.swift
//  CustomViewMVVM
//
//  Created by Jerry Ren on 10/14/20.
//  Copyright © 2020 N/A. All rights reserved.
//

import UIKit
import Foundation
   
class APIDealer {
    
    var normalClosure: ((Data?, URLResponse?, Error?) -> ())?
    
    func pullingData(stringURL: String) {
        guard let urlUnwrapped = URL(string: stringURL)
            else {
                normalClosure?(nil, nil, NetworkErros.urlNotValid)
                print(NetworkErros.urlNotValid.localizedDescription)
            return }
        
        URLSession.shared.dataTask(with: urlUnwrapped) { (data, response, erro) in
            DispatchQueue.main.async {
                self.normalClosure?(data, response, erro)
            }
        }
        .resume() 
    }
}

enum NetworkErros: Error {
    case dataEmpty
    case urlNotValid
}
