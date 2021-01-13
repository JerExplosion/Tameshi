//
//  SUpErrors.swift
//  NSDrivenByXCT
//
//  Created by Jerry Ren on 1/3/21.
//

import Foundation

enum SUpErrors: LocalizedError, Equatable {
    case parsingErro
    case requestModelErro
    case invalidUrlStrErro
    case failedRequestErro(erroDescription: String)
    
    var  errorDescription: String? {
        switch self {
        case .failedRequestErro(let erroDescription):
            return erroDescription
        case .invalidUrlStrErro, .parsingErro, .requestModelErro:
            return String.init()
        }
    }
}

