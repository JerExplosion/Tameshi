//
//  KeychainSwift.swift
//  AsyncMockExpectation
//
//  Created by Jerry Ren on 12/4/20.
//

import Foundation
import KeychainSwift
    
struct KeychainPerformanceStruct {

    static let keyChainObj = KeychainSwift.init()
    
    // MARK: - why does it say cannot find typeOfObj in scope?
    
//    func genericallySettingVal<T> (kcObj: KeychainSwift, dataOfAnyType: T, key: String, accessMethod: KeychainSwiftAccessOptions) {
//        let typeOfObj = type(of: dataOfAnyType)
//        let convertedData = dataOfAnyType as? typeOfObj
//        kcObj.set(convertedData, forKey: key, withAccess: accessMethod)
//    }

    func keyValRemovals(kcObj: KeychainSwift, key: String) {
        kcObj.delete(key)
    }
    
    func returningAllKeys(kcObj: KeychainSwift) -> Array<String> {
        return kcObj.allKeys
    }
    
}
   

