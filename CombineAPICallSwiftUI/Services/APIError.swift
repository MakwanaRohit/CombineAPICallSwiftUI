//
//  APIError.swift
//  CombineAPICallSwiftUI
//
//  Created by rohitmakwana on 25/02/24.
//

import Foundation

enum APIError: Error, Equatable {
    case invalidJSONFormat
    case customerError(code: URLError.Code, message: String)
    case unknown
}
