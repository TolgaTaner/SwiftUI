//
//  Response.swift
//  AgeOfEmpiresList
//
//  Created by Tolga Taner on 17.02.2022.
//

import Foundation
import Combine


final class Response<T: Decodable> {
    
    private let result: AnyPublisher<T, Error>
    private var cancellable: AnyCancellable?
    
    init(publisher: AnyPublisher<T, Error>) {
        self.result = publisher
    }
    
    func create(_ completion: @escaping (SinkResult<T, Error>) -> Void) {
        cancellable = result.sink { response in
            switch response {
            case .failure(let error):
                completion(.failure(error))
            case .finished:
                completion(.finished)
            }
        } receiveValue: { model in
            completion(.success(model))
        }
    }
}
