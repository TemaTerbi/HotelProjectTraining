//
//  FirstPageModel.swift
//  HotelProject
//
//  Created by Артем Соловьев on 19.12.2023.
//

import Foundation

// MARK: - FirstPage
struct FirstPage: Codable {
    var id: Int?
    var name, adress: String?
    var minimal_price: Int?
    var price_for_it: String?
    var rating: Int?
    var rating_name: String?
    var image_urls: [String]?
    var about_the_hotel: AboutTheHotel?

    enum CodingKeys: String, CodingKey {
        case id, name, adress
        case minimal_price
        case price_for_it
        case rating
        case rating_name
        case image_urls
        case about_the_hotel
    }
}

// MARK: - AboutTheHotel
struct AboutTheHotel: Codable {
    var description: String?
    var peculiarities: [String]?
}
