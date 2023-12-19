//
//  RoomsListViewModel.swift
//  HotelProject
//
//  Created by Артем Соловьев on 19.12.2023.
//

import Foundation

class RoomsListViewModel: ObservableObject {
    @Published var roomData: [Room] = []
    
    //MARK: - Api Methodts
    private func getRoomsFromApi() async {
        ApiManager.shared.getRooms { roomList in
            self.roomData = roomList
        }
    }
    
    //MARK: - Service Methodts
    func getRooms() {
        Task {
            await getRoomsFromApi()
        }
    }
}
