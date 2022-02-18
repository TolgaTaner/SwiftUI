//
//  SinkResult.swift
//  AgeOfEmpiresList
//
//  Created by Tolga Taner on 18.02.2022.
//

import Foundation

enum SinkResult<Decodable, Error: Swift.Error> {
    case success(Decodable)
    case failure(Error)
    case finished
}
