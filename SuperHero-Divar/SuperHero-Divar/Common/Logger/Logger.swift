//
//  Logger.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//

import Foundation

class Logger {
    class var prefix: String {
        return "Unknown Prefixs"
    }
    private static let separator = " -> "
    
    class func logInit(owner: String) {
        let string = "LifeCycle" + separator + owner + " init"
        print(string)
    }
    
    class func logDeinit(prefix: String? = nil, owner: String) {
        let string = "LifeCycle" + separator + owner + " deinit"
        print(string)
    }
    
    class func log(prefix: String? = nil, text: String) {
        print(text)
    }
    
    private class func appendPrefix(string: inout String) {
        string = prefix + separator + string
    }
    
    private class func print(_ string: String) {
        var string = string
        appendPrefix(string: &string)
        debugPrint(string)
    }
}
