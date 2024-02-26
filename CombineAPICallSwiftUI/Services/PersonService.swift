//
//  PersonService.swift
//  CombineAPICallSwiftUI
//
//  Created by rohitmakwana on 25/02/24.
//

import Combine
import Foundation

protocol PersonServiceProtocol {
    func getPersonList() -> AnyPublisher<Persons, APIError>
}

final class PersonService: PersonServiceProtocol {
    func getPersonList() -> AnyPublisher<Persons, APIError> {
        return URLSession.shared.dataTaskPublisher(for: URL(string: "https://fakerapi.it/api/v1/persons?_quantity=100")!)
            .tryMap { result in
                guard let response = result.response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    throw APIError.customerError(code: URLError.badServerResponse, message: "Bad Server Response")
                }
                return result.data
            }
            .decode(type: PersonResponse.self, decoder: JSONDecoder())
            .map(\.data)
            .catch { error in
                Fail(error: APIError.invalidJSONFormat).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
