//
//  CivilizationRequest.swift
//  AgeOfEmpiresList
//
//  Created by Tolga Taner on 18.02.2022.
//

import Foundation

struct CivizilationRequest: Request {
    
    var components: URLComponents?
    
    init(urlString: String) {
        self.components = URLComponents(string: urlString)!
    }
    
    func asURLRequest() -> URLRequest? {
        guard let url = components?.url else { return nil }
        return URLRequest(url: url)
    }
    
}
