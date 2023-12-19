//
//  OrderPage.swift
//  HotelProject
//
//  Created by Артем Соловьев on 19.12.2023.
//

import Foundation

// MARK: - OrderPage
struct OrderPage: Codable {
    var id: Int?
    var hotel_name, hotel_adress: String?
    var horating: Int?
    var rating_name, departure, arrival_country, tour_date_start: String?
    var tour_date_stop: String?
    var number_of_nights: Int?
    var room, nutrition: String?
    var tour_price, fuel_charge, service_charge: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case hotel_name
        case hotel_adress
        case horating
        case rating_name
        case departure
        case arrival_country
        case tour_date_start
        case tour_date_stop
        case number_of_nights
        case room, nutrition
        case tour_price
        case fuel_charge
        case service_charge
    }
}
