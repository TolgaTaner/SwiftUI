//
//  Publisher.swift
//  SwiftUINetworking
//
//  Created by Tolga Taner on 2.03.2022.
//

import Combine
import Foundation

extension Publisher {
    func retry<T: Scheduler>(
        _ retries: Int,
        delay: T.SchedulerTimeType.Stride,
        scheduler: T
    ) -> AnyPublisher<Output, Failure> {
        self.catch { _ in
            Just(())
                .delay(for: delay, scheduler: scheduler)
                .flatMap { item in
                    self }
                .retry(retries > 0 ? retries - 1 : 0)
        }
            .eraseToAnyPublisher()
    }

}
