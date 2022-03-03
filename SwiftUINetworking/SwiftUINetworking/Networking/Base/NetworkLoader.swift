//
//  NetworkLoader.swift
//  AgeOfEmpiresList
//
//  Created by Tolga Taner on 17.02.2022.
//

import Foundation

import Foundation
import Combine

final class NetworkLoader: ObservableObject {
    
    private let request: Request
    private let session: URLSession
    private let decoder: JSONDecoder
    private let queue: RunLoop
    
    init(request: Request,
         queue: RunLoop = RunLoop.main,
         session: URLSession = URLSession.shared,
         decoder: JSONDecoder = JSONDecoder()) {
        self.queue = queue
        self.request = request
        self.session = session
        self.decoder = decoder
    }
    
    enum ResponseError: Error {
        case unhandled
        case decoded
        case badRequest
        case unknown
    }
    
    enum RequestError: Error {
        case urlNotCreated
    }
    
    func request<T: Decodable>(forType type: T.Type) -> Response<T> {
        guard let urlRequest = request.asURLRequest() else {
            return Response(publisher: AnyPublisher(Fail<T, Error>(error: RequestError.urlNotCreated)))
        }
        return Response(publisher: session.dataTaskPublisher(for: urlRequest)
                            .tryMap { element -> Data in
            guard let urlResponse = element.response as? HTTPURLResponse
            else {
                throw URLError(.badServerResponse)
            }
            guard let error = urlResponse.asError() else {
                return element.data
            }
            throw error
        }
        .retry(3, delay: 1, scheduler: queue)
        .decode(type: type, decoder: decoder)
        .receive(on: queue)
        .eraseToAnyPublisher())
    }
    
    
}
