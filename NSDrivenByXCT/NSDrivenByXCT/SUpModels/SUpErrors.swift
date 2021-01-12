//
//  SUpErrors.swift
//  NSDrivenByXCT
//
//  Created by Jerry Ren on 1/3/21.
//

import Foundation

enum SUpErrors: Error, Equatable {
    case parsingErro
    case requestModelErro
    case invalidUrlStrErro
    case failedRequestErro(erroDescription: String)
}

