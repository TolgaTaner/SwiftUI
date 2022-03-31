//
//  RequestAdapter.swift
//  SwiftUINetworking
//
//  Created by Tolga Taner on 31.03.2022.
//

import Foundation

protocol RequestAdapter {
    func adapt(_ request: inout URLRequest)
    func beforeSend(_ request: URLRequest)
    func onResponse(response: URLResponse, data: Data?)
    func onError(request: URLRequest, error: Error)
    func onSuccess(request: URLRequest)
}

extension RequestAdapter {
   func adapt(_ request: inout URLRequest) { }
   func beforeSend(_ request: URLRequest) { }
   func onResponse(response: URLResponse?, data: Data?) { }
   func onError(request: URLRequest, error: Error) { }
   func onSuccess(request: URLRequest) { }
}
