//
//  AgeOfEmpiresViewModel.swift
//  AgeOfEmpiresList
//
//  Created by Tolga Taner on 18.02.2022.
//

import Foundation
import Combine
import SwiftUI

protocol DataSource {
    associatedtype Model = Decodable
    
    var list: [Model]? { get }
    var error: Error? { get }
}

//TODO: - Think that how can I do it
/*
protocol ObservableDataSource {
    associatedtype Model = Decodable
    var objectDidChange: PassthroughSubject = PassthroughSubject<[Model], Error> { get set }
}
 */


final class CivizilationsViewModel: ObservableObject, DataSource {
    
    @ObservedObject private var loader: NetworkLoader
    @Published private var response: Response<CivizilationResponse>!
    //@Published var objectDidChange: PassthroughSubject = PassthroughSubject<[Civizilation], Error>()
    @Published var list: [Civizilation]?
    @Published var error: Error?
    
    init(urlString: String) {
        let request = CivizilationRequest(urlString: urlString)
        self.loader = NetworkLoader(request: request)
    }
    
    func getCivizilations() {
        self.response = loader.request(forType: CivizilationResponse.self)
        response.create { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let response):
                self.list = response.civilizations
                //self.objectDidChange.send(response.civilizations)
            case .failure(let error):
                self.error = error
                //self.objectDidChange.send(completion: .failure(error))
            case .finished:
                break
            }
        }
    }
}



