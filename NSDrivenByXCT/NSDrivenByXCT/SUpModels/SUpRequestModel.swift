//
//  SUpRequestModel.swift
//  NSDrivenByXCT
//
//  Created by Jerry Ren on 1/2/21.
//

import Foundation

struct SUpRequestModel: Encodable {
    let first: String
    let last: String
    let email: String
    let passcode: String
}
