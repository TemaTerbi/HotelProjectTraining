//
//  MainViewModel.swift
//  HotelProject
//
//  Created by Артем Соловьев on 19.12.2023.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var hotelName = ""
    @Published var adress = ""
    @Published var rating = ""
    @Published var price = ""
    @Published var priceFor = ""
    @Published var description = ""
    @Published var peculiarities: [String] = []
    @Published var imageUrls: [String] = []
    
    //MARK: - Api Methodts
    private func getFirstPageFromApi() async {
        ApiManager.shared.getFirstPage { [weak self] page in
            self?.hotelName = page.name ?? ""
            self?.adress = page.adress ?? ""
            self?.rating = "\(page.rating ?? 0) \(page.rating_name ?? "")"
            self?.price = "от \(page.minimal_price ?? 0)"
            self?.priceFor = page.price_for_it ?? ""
            self?.description = page.about_the_hotel?.description ?? ""
            self?.peculiarities = page.about_the_hotel?.peculiarities ?? []
            self?.imageUrls = page.image_urls ?? []
        }
    }
    
    //MARK: - Service Methodts
    func getFirstPage() {
        Task {
            await getFirstPageFromApi()
        }
    }
}
