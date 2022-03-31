//
//  Log.swift
//  SwiftUINetworking
//
//  Created by Tolga Taner on 31.03.2022.
//

import Foundation

struct Log {
    
    var level: LoggingAdapter.LogLevel = .info
    
    func message(_ msg: @autoclosure () -> String, level:
                 LoggingAdapter.LogLevel) {
        guard level.rawValue <= self.level.rawValue else
        { return }
        print(msg())
    }
    
    
    func message(_ utf8Data: @autoclosure () -> Data?,
                 level: LoggingAdapter.LogLevel) {
        guard level.rawValue <= self.level.rawValue else { return }
        let stringValue = utf8Data().flatMap({ String(data: $0,
                                                      encoding: .utf8 )}) ?? "<empty>"
        message(stringValue, level: level)
    }
    
}
