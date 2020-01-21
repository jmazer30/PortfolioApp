//
//  ExpansiveObjectClass.swift
//  PortfolioApp
//
//  Created by  on 1/21/20.
//  Copyright © 2020 JordansEpicApps. All rights reserved.
//

import Foundation

class NSCache<KeyType, ObjectType> : NSObject where KeyType : AnyObject, ObjectType : AnyObject
{
    override func didChange(_ changeKind: NSKeyValueChange, valuesAt indexes: IndexSet, forKey key: String) {
        <#code#>
    }
let cache = NSCache<NSString, ExpensiveObjectClass>()
let myObject: ExpensiveObjectClass

if let cachedVersion = cache.object(forKey: "CachedObject") {
    // use the cached version
    myObject = cachedVersion
} else {
    // create it from scratch then store in the cache
    myObject = ExpensiveObjectClass()
    cache.setObject(myObject, forKey: "CachedObject")
}
}
