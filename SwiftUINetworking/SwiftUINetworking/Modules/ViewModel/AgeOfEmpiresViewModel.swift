//
//  CivilizationsViewModel.swift
//  Civilizations
//
//  Created by Tolga Taner on 18.02.2022.
//

import Foundation
import Combine
import SwiftUI

enum Datasource<T: Decodable> {
    case awaiting
    case loading
    case success(_ list: [T])
    case failure(Error)
}

final class CivilizationsViewModel: ObservableObject {
    
    @ObservedObject private var loader: NetworkLoader
    @Published private var response: Response<CivilizationResponse>!
    @Published var datasource: Datasource<Civilization> = .awaiting
    
    init(urlString: String) {
        let request = CivizilationRequest(urlString: urlString)
        self.loader = NetworkLoader(request: request)
    }
    
    func getCivizilations() {
        datasource = .loading
        response = loader.request(forType: CivilizationResponse.self)
        response.create { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let response):
                self.datasource = .success(response.civilizations)
            case .failure(let error):
                self.datasource = .failure(error)
            case .finished:
                break
            }
        }
    }
}



