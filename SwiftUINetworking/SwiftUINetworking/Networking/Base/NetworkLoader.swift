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
    private var adapters: [RequestAdapter]
    
    init(request: Request,
         queue: RunLoop = RunLoop.main,
         session: URLSession = URLSession.shared,
         decoder: JSONDecoder = JSONDecoder(),
         adapters: [RequestAdapter] = [LoggingAdapter()]) {
        
        self.queue = queue
        self.request = request
        self.session = session
        self.decoder = decoder
        self.adapters = adapters
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
        guard var urlRequest: URLRequest = request.asURLRequest() else {
            return Response(publisher: AnyPublisher(Fail<T, Error>(error: RequestError.urlNotCreated)))
        }
        adapters.forEach { $0.adapt(&urlRequest) }
        adapters.forEach { $0.beforeSend(urlRequest)}
        return Response(publisher: session.dataTaskPublisher(for: urlRequest)
                            .tryMap { [weak self ] element -> Data in
            self?.adapters.forEach { $0.onResponse(response: element.response, data: element.data)}
            guard let urlResponse = element.response as? HTTPURLResponse
            else {
                throw URLError(.badServerResponse)
            }
            guard let error = urlResponse.asError() else {
                self?.adapters.forEach { $0.onSuccess(request: urlRequest) }
                return element.data
            }
            self?.adapters.forEach { $0.onError(request: urlRequest, error: error) }
            throw error
        }
        .retry(3, delay: 1, scheduler: queue)
        .decode(type: type, decoder: decoder)
        .receive(on: queue)
        .eraseToAnyPublisher())
    }
    
    
}
