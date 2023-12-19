//
//  RoomListModel.swift
//  HotelProject
//
//  Created by Артем Соловьев on 19.12.2023.
//

import Foundation

// MARK: - RoomList
struct RoomListModel: Codable {
    var rooms: [Room]?
}

// MARK: - Room
struct Room: Codable, Identifiable {
    var id: Int?
    var name: String?
    var price: Int?
    var price_per: String?
    var peculiarities: [String]?
    var image_urls: [String]?

    enum CodingKeys: String, CodingKey {
        case id, name, price
        case price_per
        case peculiarities
        case image_urls
    }
}
