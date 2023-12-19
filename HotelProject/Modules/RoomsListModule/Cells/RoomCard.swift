//
//  RoomCard.swift
//  HotelProject
//
//  Created by Артем Соловьев on 19.12.2023.
//

import SwiftUI

struct RoomCard: View {
    
    @State private var imageSelection = 0
    var data: Room
    
    var body: some View {
        VStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 16) {
                TabView(selection: $imageSelection) {
                    ForEach(0..<(data.image_urls?.count ?? 0), id: \.self) { items in
                        Images(url: data.image_urls?[items] ?? "")
                            .tag(items)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .frame(height: 257)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(data.name ?? "")
                        .font(.system(size: 22))
                        .fontWeight(.medium)
                    
                    WrappingHStack(horizontalSpacing: 8, verticalSpacing: 8) {
                        ForEach(data.peculiarities ?? [], id: \.self) { items in
                            OptionView(optionText: items)
                        }
                    }
                    
                    HStack(spacing: 2) {
                        Text("Подробнее о номере")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                            .foregroundStyle(Color.bluePrimary)
                        
                        Image(systemName: "chevron.right")
                            .foregroundStyle(Color.bluePrimary)
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.bluePrimary.opacity(0.10))
                    .cornerRadius(5)
                }
                
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    Text("\(data.price ?? 0) ₽")
                        .font(.system(size: 30))
                        .fontWeight(.semibold)
                    
                    Text(data.price_per ?? "")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .foregroundStyle(Color.blueGray)
                }
                
                NavigationLink {
                   OrderView()
                } label: {
                    Rectangle()
                        .fill(Color.bluePrimary)
                        .frame(height: 48)
                        .cornerRadius(15)
                        .overlay {
                            Text("Выбрать номер")
                                .font(.system(size: 16))
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                        }
                }
                
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
            .padding(.top, 16)
        }
        .background(.white)
        .cornerRadius(12)
    }
}

#Preview {
    RoomCard(data: Room())
}
