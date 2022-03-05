// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let resturant = try? newJSONDecoder().decode(Resturant.self, from: jsonData)

import Foundation

// MARK: - Resturant
struct Resturant: Codable {
    let resturantElement: [ResturantElement]

    enum CodingKeys: String, CodingKey {
        case resturantElement = "ResturantElement"
    }
}

// MARK: - ResturantElement
struct ResturantElement: Codable {
    let id: Int
    let name, resturantElementDescription, hours: String
    let image: String
    let rating: Int
    let distance: Double
    let hasOffer: Bool
    let offer: Offer?

    enum CodingKeys: String, CodingKey {
        case id, name
        case resturantElementDescription = "description"
        case hours, image, rating, distance, hasOffer, offer
    }
}

enum Offer: String, Codable {
    case the9ØÙšøÙ = "9 Ø±ÙŠØ§Ù„"
}
