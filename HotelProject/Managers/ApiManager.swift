//
//  ApiManager.swift
//  HotelProject
//
//  Created by Артем Соловьев on 19.12.2023.
//

import Foundation
import Alamofire

class ApiManager {
    static let shared = ApiManager()
    
    private let getFirstPageUrl = "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473"
    private let getRooms = "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195"
    private let getOrderPage = "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff"
    
    func getFirstPage(completition: @escaping(FirstPage) -> Void) {
        AF.request(getFirstPageUrl, method: .get).responseData { responseData in
            guard let data = responseData.data else { return }
            
            if let reponse = try? JSONDecoder().decode(FirstPage.self, from: data) {
                completition(reponse)
            } else {
                print("PARSE ERROR")
            }
        }
    }
    
    func getRooms(completition: @escaping([Room]) -> Void) {
        AF.request(getRooms, method: .get).responseData { responseData in
            guard let data = responseData.data else { return }
            
            if let reponse = try? JSONDecoder().decode(RoomListModel.self, from: data) {
                if !(reponse.rooms?.isEmpty ?? false) {
                    completition(reponse.rooms ?? [])
                }
            } else {
                print("PARSE ERROR")
            }
        }
    }
    
    func getOrderPage(completition: @escaping(OrderPage) -> Void) {
        AF.request(getOrderPage, method: .get).responseData { responseData in
            guard let data = responseData.data else { return }
            
            if let reponse = try? JSONDecoder().decode(OrderPage.self, from: data) {
                completition(reponse)
            } else {
                print("PARSE ERROR")
            }
        }
    }
}
