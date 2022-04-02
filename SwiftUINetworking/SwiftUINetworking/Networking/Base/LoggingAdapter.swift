//
//  LoggingAdapter.swift
//  SwiftUINetworking
//
//  Created by Tolga Taner on 31.03.2022.
//

import Foundation

struct LoggingAdapter: RequestAdapter {
    
    enum LogLevel: Int {
        case none
        case info
        case debug
    }
    
    private let log: Log
    
    init(logLevel: LoggingAdapter.LogLevel = .info) {
        log = Log(level: logLevel)
    }
    
    
    func beforeSend(_ request: URLRequest) {
        guard let url = request.url?.absoluteString else { return }
        let method = request.httpMethod ?? ""
        log.message(" \(method) \(url)", level: .info)
        if let body = request.httpBody {
            log.message("Request body:", level: .debug)
            log.message(body, level: .debug)
        }
    }
    
    func onResponse(response: URLResponse, data: Data?) {
        guard let http = response as? HTTPURLResponse else
        { return }
        log.message("Received HTTP \(http.statusCode) from \(http.url?.absoluteString ?? "<?>")", level: .info)
        log.message("Body: ", level: .debug)
        log.message(data, level: .debug)
    }
    
    func onError(request: URLRequest, error: Error) {
        log.message(" ERROR: \(error)", level: .info)
    }
    
    
}
