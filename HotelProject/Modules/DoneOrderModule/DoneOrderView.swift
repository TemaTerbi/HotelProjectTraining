//
//  DoneOrderView.swift
//  HotelProject
//
//  Created by Артем Соловьев on 19.12.2023.
//

import SwiftUI

struct DoneOrderView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 30) {
           Circle()
                .fill(Color.backgroundGrayColor)
                .frame(width: 94, height: 94)
                .overlay {
                    Text("🎉")
                        .font(.system(size: 44))
                }
            
            Text("Ваш заказ принят в работу")
                .font(.system(size: 22))
                .fontWeight(.medium)
            
            Text("Подтверждение заказа №\(Int.random(in: 10000...99999)) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                .font(.system(size: 16))
                .fontWeight(.regular)
                .foregroundStyle(Color.blueGray)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 23)
        .navigationTitle("Заказ оплачен")
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
            
            ToolbarItem(placement: .bottomBar) {
                NavigationLink {
                    MainHotelView()
                } label: {
                    VStack {
                        Text("Супер!")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 140)
                    }
                    .frame(height: 48)
                    .background(Color.bluePrimary)
                    .cornerRadius(15)
                    .padding(.top, 15)
                }
            }
        }
        .toolbarBackground(.visible, for: .bottomBar)
    }
}

#Preview {
    DoneOrderView()
}
