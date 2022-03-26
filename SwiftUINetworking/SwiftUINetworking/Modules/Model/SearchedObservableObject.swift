//
//  SearchedObservableObject.swift
//  SwiftUINetworking
//
//  Created by Tolga Taner on 5.03.2022.
//

import Foundation

final class SearchedObservableObject<T: Decodable>: ObservableObject {
    
    @Published var result: [T] = []
    var data: [T]
    
    init(data: [T]) {
        self.data = data
    }
    
}
