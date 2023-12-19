//
//  RoomsViewList.swift
//  HotelProject
//
//  Created by Артем Соловьев on 19.12.2023.
//

import SwiftUI

struct RoomsViewList: View {
    
    @Environment(\.dismiss) var dismiss
    
    var title: String
    
    @StateObject var viewModel = RoomsListViewModel()
    
    var body: some View {
        ZStack {
            Color.backgroundGrayColor.ignoresSafeArea(edges: .bottom)
            
            ScrollView {
                ForEach(viewModel.roomData) { card in
                    RoomCard(data: card)
                        .padding(.top, 8)
                }
            }
            .scrollIndicators(.hidden)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                })
            }
        }
        .onAppear {
            viewModel.getRooms()
        }
    }
}

#Preview {
    RoomsViewList(title: "Paste title")
}
