//
//  OrderViewModel.swift
//  HotelProject
//
//  Created by Артем Соловьев on 19.12.2023.
//

import Foundation

class OrderViewModel: ObservableObject {
    @Published var orderPage: OrderPage = OrderPage()
    
    //MARK: - Api Methodts
    private func getOrderPageFromApi() async {
        ApiManager.shared.getOrderPage { page in
            self.orderPage = page
        }
    }
    
    //MARK: - Service Methodts
    func getOrderPage() {
        Task {
            await getOrderPageFromApi()
        }
    }
}
