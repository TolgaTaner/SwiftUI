//
//  Request.swift
//  AgeOfEmpiresList
//
//  Created by Tolga Taner on 18.02.2022.
//

import Foundation

protocol Request {
    var components: URLComponents? { get set }
    
    func asURLRequest() -> URLRequest?
}
