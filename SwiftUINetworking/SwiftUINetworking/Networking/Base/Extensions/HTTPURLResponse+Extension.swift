//
//  HTTPURLResponse+Extension.swift
//  AgeOfEmpiresList
//
//  Created by Tolga Taner on 18.02.2022.
//

import Foundation

extension HTTPURLResponse {
    func asError() -> NetworkLoader.ResponseError? {
        switch statusCode {
        case 200: return nil
        case 400: return .badRequest
        default: return .unknown
        }
    }
}
