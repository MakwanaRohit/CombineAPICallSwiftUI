//
//  PersonResponse.swift
//  CombineAPICallSwiftUI
//
//  Created by rohitmakwana on 25/02/24.
//

import Foundation

typealias Persons = [Person]

struct PersonResponse: Codable {
    let status: String
    let code, total: Int
    let data: Persons
}

struct Person: Codable, Hashable {
    
    let id: Int
    let firstname, lastname, email, phone: String
    let birthday: String
    let gender: Gender
    let address: Address
    let website, image: String
    
    var fullName: String {
        "\(firstname) \(lastname)"
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.id == rhs.id
    }
}

extension Person {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct Address: Codable {
    let id: Int
    let street, streetName, buildingNumber, city: String
    let zipcode, country, countyCode: String?
    let latitude, longitude: Double
    
    var fullAddress: String {
        "\(buildingNumber), \(street), \(streetName), \(city), \(country ?? "") - \(zipcode ?? "")"
    }
    
    enum CodingKeys: String, CodingKey {
        case id, street, streetName, buildingNumber, city, zipcode, country
        case countyCode
        case latitude, longitude
    }
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}
